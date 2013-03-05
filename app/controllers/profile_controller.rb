require 'profiler'

class ProfileController < ApplicationController
  # Choose to do this instead of a singleton to simplify testing
  @@profiler = Profiler.new

  def index
    @started = profiler.should_run?
    @calls = profiler.calls.
                sort_by {|_,v| v}.
                reverse
    @sample_count = profiler.sample_count
  end

  def start
    profiler.start
    redirect_to :action => "index"
  end

  def stop
    profiler.stop
    redirect_to :action => "index"
  end

  def profiler
    @@profiler
  end
end
