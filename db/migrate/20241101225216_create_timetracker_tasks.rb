class CreateTimetrackerTasks < ActiveRecord::Migration[7.2]
  def change
    create_table :timetracker_tasks do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
