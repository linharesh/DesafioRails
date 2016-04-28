require_relative '../models/web_launcher'


class UffmailController < ApplicationController

	def new
		matricula = params[:matricula] 
		weblauncher = WebLauncher.new
		@person = weblauncher.person_by_registration matricula
		result = weblauncher.can_create_email_for @person
		if !result
			render :fail_to_create
		else
			@options = weblauncher.generate_options_for @person
			render :display_options
		end
	end

	def display_options
	end


	def fail_to_create
	end

end
