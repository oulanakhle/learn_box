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

  def edit
    @goal = Goal.find(params[:goal_id])
    @task = Task.find(params[:id])
  end

  def update
    @goal = Goal.find(params[:goal_id])
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to goal_path(@goal)
  end

  def destroy
    @goal = Goal.find(params[:goal_id])
    @task = Task.find(params[:id])
    @task.destroy()
    redirect_to goal_path(@goal)
  end

  def update_complete
    task = Task.find(params[:id])
    task.complete = !task.complete
    @task.save

    @goal = task.goal
    redirect_to goal_path(@goal)
  end


private

def task_params
  params.require(:task).permit(:name, :hours)
end

end
