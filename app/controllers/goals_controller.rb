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
    admin_goal = Goal.find(params[:id])
    @goal= admin_goal.dup

    if @goal.save
      admin_goal.tasks.each do |task|
        new_task = task.dup
        new_task.goal = @goal
        new_task.save
      end
      redirect_to dashboard_path()
    else
      render 'new'
      # do
    end
  end

  private

  def goal_params
    params.require(:goal).permit(:name, :difficulty, :completed)
  end

end
