class StudentsController < ApplicationController
  def index
  	@students = current_account.people.student
  end

  def show
  	@student = current_account.people.student.find(params[:id])
  end
end
