class BurndownsController < ApplicationController
  unloadable
  menu_item :burndown

  before_filter :find_version_and_project, :authorize, :only => [:show]

  def show
    @chart = BurndownChart.new(@version)
  end

private
  def find_version_and_project
    @project = Project.find(params[:project_id])
    @version = params[:id] ? @project.versions.find(params[:id]) : @project.current_version
    render_error("There is no current Sprint for this Project") and return unless @version
  end
end