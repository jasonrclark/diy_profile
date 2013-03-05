class Profiler
  attr_reader :thread, :sample_count

  def initialize(interval = 0.1)
    @running = false
    @sample_count = 0
    @interval = interval
  end

  def start
    @running = true
    @thread = Thread.new do
      while should_run?
        @sample_count += 1
        sleep(@interval)
      end
    end
  end

  def stop
    @running = false
  end

  def started?
    @running
  end

  def should_run?
    @running
  end
end

