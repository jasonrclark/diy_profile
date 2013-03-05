require 'timeout'

class ProfilerTest < Test::Unit::TestCase

  def test_profiler_does_not_start_in_running_state
    assert_equal false, profiler.should_run?
  end

  def test_profiler_can_stop
    run_profiler do
      profiler.stop
    end

    assert_equal false, profiler.should_run?
  end

  def test_profiler_takes_sample_count
    set_to_profile(2)
    run_profiler
    assert_equal 2, profiler.sample_count
  end

  def test_profiler_captures_nodes
    set_to_profile_once
    run_profiler
    assert_not_equal 0, profiler.nodes.count
  end

  FILE_POSITION   = 0
  METHOD_POSITION = 1
  LINE_POSITION   = 2

  def test_captured_nodes_include_expected_code
    set_to_profile_once
    run_profiler

    assert_not_nil profiler.nodes.find {|k, v| k[FILE_POSITION].include?(__FILE__)}
    assert_not_nil profiler.nodes.find {|k, v| k[METHOD_POSITION] == __method__.to_s }
  end

  def test_captured_nodes_include_expected_code
    set_to_profile(2)
    run_profiler

    node = profiler.nodes.find {|k, v| k[FILE_POSITION].include?(__FILE__)}
    assert_equal 2, node[1]
  end


  # Setup/Teardown

  def setup
    @profiler = Profiler.new(0.01) # Short interval for testing
  end

  def teardown
    @profiler.stop
    @profiler.thread.kill unless @profiler.thread.nil?
  end


  # Helpers

  def set_to_profile_once
    set_to_profile(1)
  end

  def set_to_profile(times)
    returns = Array.new(times, true) + [false]
    profiler.stubs(:should_run?).returns(*returns)
  end

  def run_profiler
    profiler.start
    yield if block_given?

    Timeout::timeout(0.1) do
      profiler.thread.join
    end
  end

  attr_reader :profiler
end
