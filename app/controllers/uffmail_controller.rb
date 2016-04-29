require_relative '../models/person_finder'
require_relative '../models/person_validator'
require_relative '../models/uffmail_options_generator'
require_relative '../models/uffmail'


class UffmailController < ApplicationController

	def new
		matricula = params[:matricula] 		
		person_finder = PersonFinder.new(PersonManager.instance.people)
		@person = person_finder.find_by('matricula', matricula)
		person_validator = PersonValidator.new(@person)
		result = person_validator.valid_person? ? true : false
		puts result
		if result
			@options = UffmailOptionsGenerator.new(@person).options
			session[:matricula] = @person.matricula
			render :display_options
		else
			@errors = person_validator.error_messages
			render :fail_to_create
		end

	end

	def create
		Uffmail.create(session[:matricula], params[:opcao])
	end

	def display_options
	end


	def fail_to_create
	end

end
