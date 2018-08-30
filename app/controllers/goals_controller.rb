class GoalsController < ApplicationController
  def index
    #@subject = Subject.find()
  end

def show
  @goal = Goal.find(params[:id])
  @task = Task.new
  @goals = Goal.all
end

  def new
  end
end
