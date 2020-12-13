class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, except: [:index, :new, :create]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    project = Project.new(project_params)
    respond_to do |format|
      if project.save
        format.html { redirect_to projects_url, notice: "Sucessfully Created"}
      else
        format.html { render :new, notice: "Something went wrong"}
      end
    end
  end


  def edit
  end

  def show
  end

  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html{ rediect_to @project, notice: "Updated Successfully"}
      else
        format.html{render :edit, error: "Something went wrong"}
      end
    end
  end

  def destroy 
    @project.delete
    respond_to do |format|
      format.html{ redirect_to projects_url, notice: "Project was deleted Successfully"}
    end
  end

  private

  def project_params
    params.require(:project).permit(:name, :description)
  end

  def set_project
    @project = Project.find(params[:id])
  end
end

