module Timetracker
  class Task < ApplicationRecord
    has_many :timers, foreign_key: "timetracker_task_id", class_name: "Timetracker::Timer", inverse_of: :task, dependent: :destroy

    validates_presence_of :name

    def duration_in_seconds
      timers.sum(&:duration_in_seconds)
    end
  end
end
