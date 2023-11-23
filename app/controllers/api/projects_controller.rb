class Api::ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :update, :destroy]

  def index
    projects = Project.all

    projects_json = projects.map do |project|
      {
        id: project.id,
        name: project.name,
        location: project.location,
        task: project.task,
        date: project.date
      }
    end
    render json: projects_json
  end

  def show
    if item
      render json: @item
    else
      render json: { errors: 'Project not found' }, status: :not_found
    end
  end

  def destroy
    if @item.destroy
      render json: { message: 'Project deleted' }
    else
      render json: { errors: @item.errors.full_messages }, status: :bad_request
    end
  end

  def create
    project = Project.new(project_params)

    if project.save
      render json: project
    else
      render json: { errors: project.errors.full_messages }, status: :bad_request
    end
  end

  private

  def set_project
    @item = Project.find_by(id: params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :location, :task, :date)
  end
end
