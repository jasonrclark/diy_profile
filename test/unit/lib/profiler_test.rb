require 'timeout'

class ProfilerTest < Test::Unit::TestCase

  def test_profiler_does_not_start_in_running_state
    assert_equal false, profiler.started?
  end

  def test_is_running_when_started
    profiler.stubs(:should_run?).returns(false)
    run_profiler
    assert profiler.started?
  end

  def test_profiler_stops
    run_profiler do
      profiler.stop
    end

    assert_equal false, profiler.started?
  end

  def test_profiles
    profiler.stubs(:should_run?).returns(true, true, false)
    run_profiler
    assert_equal 2, profiler.sample_count
  end

  def run_profiler
    profiler.start
    yield if block_given?

    Timeout::timeout(0.1) do
      profiler.thread.join
    end
  end


  def setup
    @profiler = Profiler.new(0.01) # Short interval for testing
  end

  def teardown
    @profiler.stop
    @profiler.thread.kill unless @profiler.thread.nil?
  end

  attr_reader :profiler

end
