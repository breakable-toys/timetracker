require "test_helper"

module Timetracker
  class TimerTest < ActiveSupport::TestCase
    def setup
      @timer = timetracker_timers(:dance_one)
    end

    test "valid timer" do
      assert @timer.valid?
    end

    test "calculate duration in seconds if timer is not running" do
      assert_equal 120, @timer.duration_in_seconds
    end

    test ".duration_in_seconds is nil if timer is still running" do
      assert_nil timetracker_timers(:dance_two).duration_in_seconds
    end
  end
end
