class Profiler
  attr_reader :sample_count, :calls

  def initialize(interval = 0.1)
    @interval = interval
    @running = false
    @sample_count = 0
    @calls = Hash.new(0)
  end

  def should_run?
    @running
  end

  def start
    return if @running
    @running = true

    Thread.new do
      while should_run?
        take_sample
        sleep(@interval)
      end
    end
  end

  def stop
    @running = false
  end

  def take_sample
    @sample_count += 1
    Thread.list.each do |thread|
      next if thread.backtrace.nil?
      thread.backtrace.each do |line|
        count_backtrace_line(line)
      end
    end
  end

  def count_backtrace_line(line)
    @calls[key(line)] += 1
  end

  BACKTRACE_LINE_REGEX = /(.*)\:(\d+)\:in `(.*)'/
  def key(line)
    BACKTRACE_LINE_REGEX.match(line).captures
  end
end