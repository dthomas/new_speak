class PeopleController < ApplicationController
	def index
		@people = current_account.people
	end

	def new
		@person = current_account.people.build(date_of_admission: Date.today)
	end

	def create
		@person = current_account.people.build(person_attrs)
		@person.role = "student"
		@person.admission_number = current_account.last_admission_number + 1
		if @person.save
			current_account.update(last_admission_number: @person.admission_number)
			redirect_to dashboards_path, notice: "Person was created successfully"
		else
			p @person.errors
			render :new
		end
	end

	private

	def person_attrs
		params.require(:person).permit(:first_name, :middle_name, :last_name, :date_of_birth, :email, :password, :password_digest, :gender, Person.stored_attributes[:profile])
	end
end
