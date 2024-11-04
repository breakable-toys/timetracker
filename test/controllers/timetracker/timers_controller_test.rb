require "test_helper"

module Timetracker
  class TimersControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @task = timetracker_tasks(:dance)
    end

    test "should start timer" do
      assert_difference("Timer.count") do
        post task_timers_path(@task)
      end

      assert_redirected_to task_url(@task)
    end

    test "should stop running timer" do
      @timer = timetracker_timers(:dance_two)

      assert_nil @timer.duration_in_seconds

      assert_no_difference("Timer.count") do
        patch timer_path(@timer)
      end

      @timer.reload
      assert_not_nil @timer.duration_in_seconds
    end
  end
end
