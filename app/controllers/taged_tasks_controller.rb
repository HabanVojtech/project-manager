class TagedTasksController < ApplicationController
  def index
    @taged_tasks = TagedTask.all
  end

  def show
    @taged_task = current_user.taged_tasks.find(params[:id])
  end

  def new
    @taged_task = TagedTask.new
  end

  def edit
    @taged_task = current_user.taged_tasks.find(params[:id])
  end

  def create
    @taged_task = TagedTask.create(taged_task_params)
    redirect_to "/taged_tasks"
    
  end

  def update
    @taged_task = current_user.taged_tasks.find(params[:id])
    @taged_task.update(taged_task_params)
    redirect_to "/taged_tasks"
  end

  def destroy
    @taged_task = current_user.taged_tasks.find(params[:id])
    @taged_task.destroy
    redirect_to "/taged_tasks"
  end

  private

    # Only allow a list of trusted parameters through.
    def taged_task_params
      params.require(:taged_task).permit(:task_id, :tag_id)
    end
end
