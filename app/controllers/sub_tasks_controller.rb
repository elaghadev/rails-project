class SubTasksController < ApplicationController
    before_action :set_weekly_plan
    before_action :set_task
    before_action :set_sub_task, only: [:destroy]
  
    # GET /weekly_plans/:weekly_plan_id/tasks/:task_id/sub_tasks/new
    def new
      @sub_task = @task.sub_tasks.build
    end
  
    # POST /weekly_plans/:weekly_plan_id/tasks/:task_id/sub_tasks
    def create
      @sub_task = @task.sub_tasks.build(sub_task_params)
  
      if @sub_task.save
        redirect_to weekly_plan_path(@weekly_plan), notice: 'Sub-task was successfully created.'
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    # DELETE /weekly_plans/:weekly_plan_id/tasks/:task_id/sub_tasks/:id
    def destroy
      @sub_task.destroy
      redirect_to weekly_plan_path(@weekly_plan), notice: 'Sub-task was successfully deleted.'
    end
  
    private
  
    def set_weekly_plan
      @weekly_plan = WeeklyPlan.find(params[:weekly_plan_id])
    end
  
    def set_task
      @task = @weekly_plan.tasks.find(params[:task_id])
    end
  
    def set_sub_task
      @sub_task = @task.sub_tasks.find(params[:id])
    end
  
    def sub_task_params
      params.require(:sub_task).permit(:title, :description)
    end
  end
  