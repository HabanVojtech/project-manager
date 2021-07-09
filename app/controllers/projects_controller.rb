class ProjectsController < ApplicationController
    def index
        @pagy, @projects = pagy(current_user.projects.all,items:10) 
    end

    def show
        @project = current_user.projects.find(params[:id])
    end
    
    def new
        @project = current_user.projects.new(user_id: params[:user_id])
    end

    def create
        @project = Project.create(project_params)
        redirect_to @project
    end
    
    def edit
       @project = current_user.projects.find(params[:id])
    end

    def update
       @project= current_user.projects.find(params[:id])
       
        if @project.update(project_params)
            redirect_to @project
        else
            redirect_to edit
        end
    end

    def destroy
       @project = Project.find(params[:id])
       @project.destroy
       redirect_to projects_url
    end

    private
        def project_params
            params.require(:project).permit(:title,:position,:user_id)
        end
    
end
