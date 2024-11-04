require "test_helper"

module Timetracker
  class TimersControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @task = timetracker_tasks(:dance)
      @timer = timetracker_timers(:dance_two)
    end

    test "should start timer" do
      assert_difference("Timer.count") do
        post task_timers_url(@task)
      end

      assert_redirected_to task_url(@task)
    end

    test "should stop running timer" do
      assert_nil @timer.duration_in_seconds

      assert_no_difference("Timer.count") do
        patch timer_url(@timer)
      end

      @timer.reload
      assert_not_nil @timer.duration_in_seconds
    end

    test "should destroy timer" do
      assert_difference("Timer.count", -1) do
        delete timer_url(@timer)
      end

      assert_redirected_to task_url(@timer.task)
    end
  end
end
