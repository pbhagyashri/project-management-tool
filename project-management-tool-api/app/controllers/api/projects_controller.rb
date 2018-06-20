class Api::ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  
  def index
    render json: Project.all
  end

  def create
    project = Project.new(project_params)

    if project.save
      render json: project, status: 200
    else
      render json: {message: project.errors}, status: 400
    end
  
  end
  
  def show
    render json: @project
  end
  
  def update
    if @project.update(project_params)
      render json: @project
    else
      render json: {message: @project.errors}, status: 400
    end
  end

  def destroy
    if @project.destroy
      render status: 204
    else
      render json: {message: "unable to process your request"}, status: 400
    end
  end

  private

  def project_params
    params.require(:project).permit(:name, :start_date, :end_date, :summary,:user_id)
  end

  def set_project
    @project = Project.find_by(id: params[:id])
  end

end