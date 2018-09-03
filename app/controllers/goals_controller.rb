class GoalsController < ApplicationController
  def index
    #@subject = Subject.find(params[:id]) wrong because is trying to display all goals but subjects are linked to specific id
    @goals = Goal.all
    @subject = Subject.all
    @tasktime = 0
    @new_goal = Goal.new
    #@new_goal.tasks.build
    #raise
    #Goal.find(params[:id])
    #  Goal.tasks.each do |task|
    #  end


    #should I go through all the tasks & calc --> total time, deadline?
  end

  def show
    @goal = Goal.find(params[:id])
    @tasks = Task.all
    @goals = Goal.all

  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user = current_user
    @subject = Subject.find(params[:goal][:subject_id])
    @goal.subject = @subject

    if @goal.save
      redirect_to dashboard_path()
    else
      render 'new'
      # do
    end
  end


  def create_from_copy
    @goal = Goal.new(goal_params)
    @goal.user = current_user
    @subject = Subject.find(params[:goal][:subject])
    @goal.subject = @subject

    if @goal.save
      redirect_to dashboard_path()
    else
      render 'new'
      # do
    end

    #TODO with nested attributes
    params[:goal][:tasks].split(" ").each do |task_id|
      task = Task.find(task_id)
      new_task = Task.new
      new_task.name = task.name
      new_task.hours = task.hours
      new_task.completed = false
      new_task.goal = @goal
      new_task.save
    end
  end

  private

  def goal_params
    params.require(:goal).permit(:name, :difficulty, :completed)
  end

end
