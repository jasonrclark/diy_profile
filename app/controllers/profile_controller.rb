require 'profiler'

class ProfileController < ApplicationController
  # Choose to do this instead of a singleton to simplify testing
  @@profiler = Profiler.new

  def index
    @started = profiler.started?
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
