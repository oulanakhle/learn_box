class GoalsController < ApplicationController
  def index
    if params[:difficulty]
      @goals = Goal.where(difficulty: params[:difficulty])
      @difficulty = params[:difficulty]
    elsif params[:query].present?
      sql_query = "name ILIKE?"
      @goals = Goal.where(sql_query, "%#{params[:query]}%")
    else
      @goals = Goal.all
    end
    @subject = Subject.all
    @tasktime = 0
    @new_goal = Goal.new

    respond_to do |format|
      format.html
      format.js
    end

    #should I go through all the tasks & calc --> total time, deadline?
  end

  def show
    @goal = Goal.find(params[:id])
    @tasks = Task.all
    @goals = Goal.all
    @links = Link.all

  end

  def show_public
    @goal = Goal.find(params[:id])
    @tasks = Task.all
    @goals = Goal.all
    @links = Link.all
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
    @my_goal= admin_goal.dup
    @my_goal.votes = 1
    @my_goal.user = current_user

    if @my_goal.save
      admin_goal.tasks.each do |task|
        new_task = task.dup
        new_task.goal = @my_goal
        new_task.save
      end
      redirect_to goals_path()

    else
      render 'new'
      # do
    end
  end

  def edit
    @goal = Goal.find(params[:id])
  end

  def update
    @goal = Goal.find(params[:id])
    @goal.update(goal_params)
    redirect_to goals_path(@goal)
  end

  def destroy
    @goal = Goal.find(params[:id])
    @goal.destroy()
    redirect_to dashboard_path()
  end

  private

  def goal_params
    params.require(:goal).permit(:name, :difficulty, :completed)
  end

end
