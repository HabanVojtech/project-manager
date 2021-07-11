class TagedTasksController < ApplicationController
  def index
    @pagy,@taged_tasks = pagy(TagedTask.all,items:10)
  end

  def show
    @taged_task = TagedTask.find(params[:id])
  end

  def new
    @taged_task = TagedTask.new
  end

  def edit
    @taged_task = TagedTask.find(params[:id])
  end

  def create
    @taged_task = TagedTask.create(taged_task_params)
    redirect_to "/taged_tasks"
    
  end

  def update
    @taged_task = TagedTask.find(params[:id])
    @taged_task.update(taged_task_params)
    redirect_to "/taged_tasks"
  end

  def destroy
    @taged_task = TagedTask.find(params[:id])
    @taged_task.destroy
    redirect_to "/taged_tasks"
  end

  private

    # Only allow a list of trusted parameters through.
    def taged_task_params
      params.require(:taged_task).permit(:task_id, :tag_id)
    end
end
