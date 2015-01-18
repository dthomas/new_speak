class TutorialsController < ApplicationController
	def show
		@tutorial = current_account.tutorials.find(params[:id])
		authorize @tutorial
	end
end
