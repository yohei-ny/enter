class Public::ClassTasksController < ApplicationController
	before_action :authenticate_user!
  def index
  	@center =Center.all
  	@class_task =ClassTask.all
  end

  def show
    @id =params[:id]
    @class_task =ClassTask.find_by(id: @id)
  	@task =TaskContent.find_by(task_times: @id)
  end
end
