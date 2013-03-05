class Profiler
  def initialize
    @running = false
  end

  def start
    @running = true
  end

  def stop
    @running = false
  end

  def started?
    @running
  end
end
