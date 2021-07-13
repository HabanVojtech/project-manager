class TagedTasksController < ApplicationController
  def index
<<<<<<< HEAD
    @taged_tasks = TagedTask.all.includes([:task,:tag])
=======
    @taged_tasks = TagedTask.all.includes([:task])
>>>>>>> a7a346c7446c3398e8e716e477bb51a50db29083
    
  end

  def show
    @taged_task = TagedTask.find(params[:id])
  end

  def new
    @task_list = Task.where("user_id" => current_user.id)
     @tag_list = Tag.where("user_id" => current_user.id)
    @taged_task = TagedTask.new
  end

  def edit
    @task_list = Task.where("user_id" => current_user.id)
    @taged_task = TagedTask.find(params[:id])
    @tag_list = Tag.where("user_id" => current_user.id)
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
