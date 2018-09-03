class TasksController < ApplicationController

  def new
    @task = Task.new
    @goal = Goal.find(params[:goal_id])
  end

  def create
    @task = Task.new(task_params)
    @goal = Goal.find(params[:goal_id])
    @task.goal = @goal
    if @task.save
      redirect_to goal_path(@goal)
    else
      render 'new'
      # do
    end
  end



private

def task_params
  params.require(:task).permit(:name, :hours)
end

end
