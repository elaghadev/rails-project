class WeeklyPlansController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @weekly_plans = WeeklyPlan.all
  end

  def show
    @weekly_plan = WeeklyPlan.find(params[:id])
  end

  def new
    @weekly_plan = WeeklyPlan.new
  end

  def create
    @weekly_plan = WeeklyPlan.new(weekly_plan_params)

    if @weekly_plan.save
      redirect_to weekly_plans_path, notice: 'Weekly Plan was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def weekly_plan_params
    params.require(:weekly_plan).permit(:week, :category, :goal)
  end

  def edit
    @weekly_plan = WeeklyPlan.find(params[:id])
  end
  
  def update
    @weekly_plan = WeeklyPlan.find(params[:id])
  
    if @weekly_plan.update(weekly_plan_params)
      redirect_to weekly_plans_path, notice: 'Weekly Plan was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end
end
