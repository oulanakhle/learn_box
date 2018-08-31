class GoalsController < ApplicationController
  def index
    #@subject = Subject.find(params[:id]) wrong because is trying to display all goals but subjects are linked to specific id
    @goals = Goal.all
    @subject = Subject.all
    @tasktime = 0
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
    @subject = Subject.find(params[:goal][:subject_id])
    @goal.subject = @subject
    if @goal.save
      redirect_to goal_path(@goal)
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
