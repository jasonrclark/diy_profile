
class ProfilerTest < Test::Unit::TestCase
  def test_profiler_does_not_start_in_running_state
    profiler = Profiler.new
    assert_equal false, profiler.started?
  end

  def test_is_running_when_started
    profiler = Profiler.new
    profiler.start
    assert profiler.started?
  end

  def test_profiler_stops
    profiler = Profiler.new
    profiler.start
    assert profiler.started?

    profiler.stop
    assert_equal false, profiler.started?
  end
end
