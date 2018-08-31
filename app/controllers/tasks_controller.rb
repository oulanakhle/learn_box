class TasksController < ApplicationController

  def create
    @task = Task.new(task_params)
    @goal = Goal.find(params[:goal_id])

    if @task.save
      redirect_to goal_task_path(@goal, @task)
    else
      render 'new'
      # do
    end
  end

  def new
    @task = Task.new
    @goal = Goal.find(params[:goal_id])
  end

private

def task_params
  params.require(:task).permit(:name, :due_date, :hours)
end

end
