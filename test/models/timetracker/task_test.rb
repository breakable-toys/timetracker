require "test_helper"

module Timetracker
  class TaskTest < ActiveSupport::TestCase
    def setup
      @task = timetracker_tasks(:dance)
    end

    test "valid task" do
      assert @task.valid?
    end

    test "invalid if empty name" do
      @task.name = ""

      assert_not @task.valid?
      assert_not_nil @task.errors[:name]
    end
  end
end
