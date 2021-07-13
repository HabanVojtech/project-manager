class TagsController < ApplicationController

  def index
    @pagy, @tags = pagy(current_user.tags.all,items:10)
  end

  def show
   @tag = current_user.tags.find(params[:id])
  end

  def new
    @tag = current_user.tags.new(user_id: params[:user_id])
  end

  def edit
   @tag = current_user.tags.find(params[:id]) 
  end

  def create
    @tag = Tag.create(tag_params)
    redirect_to tag_path(@tag)
  end

  def update
    @tag = current_user.tags.find(params[:id]) 
    @tag.update(tag_params)
    redirect_to tag_path(@tag)
  end

  def destroy
    @tag = current_user.tags.find(params[:id]) 
    @tag.destroy
    redirect_to "/tags"
  end

  private

    # Only allow a list of trusted parameters through.
    def tag_params
      params.require(:tag).permit(:title, :user_id)
    end
end
