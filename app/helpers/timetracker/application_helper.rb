module Timetracker
  module ApplicationHelper
    def seconds_to_human(seconds)
      Time.at(seconds).utc.strftime("%H:%M:%S")
    end
  end
end
