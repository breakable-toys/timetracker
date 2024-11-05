module Timetracker
  class Timer < ApplicationRecord
    belongs_to :task, foreign_key: "timetracker_task_id", class_name: "Timetracker::Task", inverse_of: :timers

    def duration_in_seconds
      ((stopped_at || Time.current) - started_at).ceil
    end
  end
end
