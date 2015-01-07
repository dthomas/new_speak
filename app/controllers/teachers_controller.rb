class TeachersController < ApplicationController
	def index
		@teachers = current_account.people.teacher
	end

	def new
		@teacher = Person.teacher.new
		2.times { @teacher.relatives.build }
	end

	def create
		@teacher = current_account.people.teacher.build(teacher_params)
		@teacher.employee_number = current_account.last_employee_number + 1
		@teacher.relatives.each do |relative|
			relative.institute = current_account
			relative.role = :guardian
		end
		if @teacher.save
			Institute.increment_counter(:last_employee_number, current_account)
			redirect_to teachers_path, notice: "Joining for #{@teacher.name} (Employee Number: #{@teacher.employee_number}) completed"
		else
			binding.pry
		end
	end

	def show
		@teacher = current_account.people.teacher.find(params[:id])
	end

	def edit
		@teacher = current_account.people.teacher.find(params[:id])
	end

	def update
		@teacher = current_account.people.teacher.find(params[:id])
		if @teacher.update(teacher_params)
			redirect_to teacher_path(@teacher), notice: "Record for #{@teacher.name} updated"
		else
			render :edit
		end
	end

	private

	def teacher_params
		params.require(:teacher).permit(
			:first_name, :middle_name, :last_name, :date_of_birth, :date_of_joining, :gender, :religion, :caste,
				relatives_attributes: 
				[:id, :first_name, :middle_name, :last_name, :date_of_birth, :gender, :relation, :occupation, :religion, :caste]
			)
	end
end