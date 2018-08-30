class GoalsController < ApplicationController
  def index
    #@subject = Subject.find(params[:id]) wrong because is trying to display all goals but subjects are linked to specific id
    @goals = Goal.all
    #should I go through all the tasks & calc --> total time, deadline?
  end

  def show
    @goal = Goal.find(params[:id])
    @task = Task.new
    @goals = Goal.all
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user = current_user
    if @dinner.save
      redirect_to goal_path(@goal)
    else
      render 'new'
      # do
    end
  end

  private

  def dinner_params
    params.require(:goal).permit(:name, :goal_difficulty, :completed)
  end

end
