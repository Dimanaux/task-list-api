class ProjectsController < ApplicationController
  expose :projects, ->{ Project.all }
  expose :project

  def index
  end

  def show
  end

  def create
    if project.save
      redirect_to project_path(project)
    else
      render json: project.errors, status: :unprocessable_entity
    end
  end

  def update
    if project.update(project_params)
      redirect_to project_path(project)
    else
      render json: project.errors, status: :unprocessable_entity
    end
  end

  def destroy
    project.destroy
  end

  private

  def project_params
    params.require(:project).permit(:title)
  end
end
