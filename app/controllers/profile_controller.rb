require 'profiler'

class ProfileController < ApplicationController
  # Choose to do this instead of a singleton to simplify testing
  @@profiler = Profiler.new

  FRAMEWORK_PATH = /\/lib\/ruby\//
  SCRIPT_RAILS_PATH = /script\/rails/
  PROFILER_PATH  = /\/diy_profile\/lib\/profiler\.rb/

  def index
    @started = profiler.should_run?

    calls = profiler.calls
    calls = filter_calls(calls, FRAMEWORK_PATH,    "framework")
    calls = filter_calls(calls, SCRIPT_RAILS_PATH, "framework")
    calls = filter_calls(calls, PROFILER_PATH,     "profiler")
    @calls = calls.sort_by {|_,v| v}.reverse

    @sample_count = profiler.sample_count
  end

  def filter_calls(calls, regex, param)
    return calls unless request.query_parameters[param] == "1"
    calls.reject {|c| c[0].match regex}
  end

  def start
    profiler.start
    redirect_to :action => "index", :params => request.query_parameters
  end

  def stop
    profiler.stop
    redirect_to :action => "index", :params => request.query_parameters
  end

  def profiler
    @@profiler
  end
end
