class ClassGroupsController < ApplicationController
  def new
    @course_session = current_account.course_sessions.find(params[:course_session_id])
    @class_group = current_account.class_groups.build(course_session_id: params[:course_session_id], institute_id: current_account.id)
    @course_session.students.each do |student|
      @class_group.class_group_students.build(person_id: student.id)
    end
    
    @course_session.current_term.course_subjects.each do |subject|
      @class_group.teaching_assignments.build(course_subject: subject, institute: current_account)
    end
  end

  def create
    @course_session = current_account.course_sessions.find(params[:course_session_id])
    @class_group = current_account.class_groups.build(class_group_params)
    @class_group.course_session = @course_session
    @class_group.term_class = @course_session.term_class
    if @class_group.save
      redirect_to @class_group, notice: "New Class Group Created Successfully"
    else
    binding.pry
      render :new
    end
  end

  def show
  	@class_group = current_account.class_groups.find(params[:id])
    authorize @class_group
    @course_session = @class_group.course_session
    @students = @class_group.students.order(:roll_number)
  end

  def edit
  	@class_group = current_account.class_groups.find(params[:id])
    @course_session = @class_group.course_session
    @students = @course_session.students
    @course_session.current_term.course_subjects.each do |subject|
      @class_group.teaching_assignments.build(course_subject: subject, institute: current_account)
    end
  end

  def update
    @class_group = current_account.class_groups.find(params[:id])

    if @class_group.update(class_group_params)
      redirect_to @class_group, notice: "Class Group has been updated."
    else
      @course_session = @class_group.course_session
      @students = @course_session.students
      render :edit
    end
  end

  private

  def class_group_params
    params.require(:class_group).permit(:name, :start_date, :end_date, :person_id ,student_ids: [],
      teaching_assignments_attributes: [:id, :course_subject_id, :person_id, :institute_id])
  end
end
