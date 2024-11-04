module Timetracker
  class TimersController < ApplicationController
    before_action :set_task, only: %i[ create ]
    before_action :set_timer, only: %i[ update destroy ]

    def create
      @timer = @task.timers.new({ started_at: Time.now })

      if @timer.save
        flash[:notice] = "Timer was successfully started."
      else
        flash[:alert] = "An error occurred and timer was not started."
      end

      redirect_to @task
    end

    def update
      if @timer.update({ stopped_at: Time.now })
        redirect_to @timer.task, notice: "Timer was successfully stopped.", status: :see_other
      else
        redirect_to @timer.task, alert: "An error occurred and timer was not stopped.", status: :unprocessable_entity
      end
    end

    def destroy
      @timer.destroy!
      redirect_to @timer.task, notice: "Timer was successfully destroyed.", status: :see_other
    end

    private
      def set_task
        @task = Task.find(params[:task_id])
      end

      def set_timer
        @timer = Timer.find(params[:id])
      end
  end
end
