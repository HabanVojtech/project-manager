class TasksController < ApplicationController
    def index
        if params[:n] == "true" || params[:n] == "false"
            @pagy, @tasks = pagy(current_user.tasks.done(params[:n]).with_attached_file,items:10)
        else
            @pagy, @tasks = pagy(current_user.tasks.all.with_attached_file,items:10)
        end
    end

    def show
      @task = current_user.tasks.find(params[:id])
    end

  
    def new
        @project = Project.find(params[:id])
        @task = @project.tasks.build
    end

 
  def edit
    @task = current_user.tasks.find(params[:id])
  end

    def create
        @project = Project.find(params[:id])
        @task = @project.tasks.create(task_params)
        if @task.save    
        redirect_to @task
        end
    end

  def update
    @task = current_user.tasks.find(params[:id])
    if @task.update(task_params)
        redirect_to @task
    else
        redirect_to edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy  
    redirect_to tasks_path
  end

  private

    def task_params
      params.require(:task).permit(:title, :description, :is_done, :file, :project_id, :user_id)
    end
end