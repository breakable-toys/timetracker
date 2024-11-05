class CreateTimetrackerTimers < ActiveRecord::Migration[7.2]
  def change
    create_table :timetracker_timers do |t|
      t.references :timetracker_task, null: false, foreign_key: true
      t.datetime :started_at, null: false
      t.datetime :stopped_at

      t.timestamps
    end
  end
end
