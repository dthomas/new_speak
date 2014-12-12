class ClassGroupsController < ApplicationController
  def index
  end

  def new
  	@class_group = current_account.class_groups.build(course_session_id: params[:course_session_id])
  end
end
