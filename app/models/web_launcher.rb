require_relative './parser'
require_relative 'config'
require_relative 'person_finder'
require_relative 'person_validator'
require_relative 'uffmail_options_generator'
require_relative 'uffmail'

	class WebLauncher
		
		def person_by_registration(registration)
			person = get_person(registration)
		end

		def can_create_email_for(person)
			validator(person).valid_person? ? true : false
		end


		def show_errors_for(person)
			puts validator(person).error_messages
		end

		def generate_options_for(person)
			UffmailOptionsGenerator.new(person).options
		end

		def generate_email_for(person)
			puts 'WebLauncher # generate_email_for'
			Uffmail.create(person)
			
		end

		def get_person(registration)
			people = parser.parse
			finder(people).find_by('matricula', registration)
		end

		def parser
			Parser.new(Config::PATH)
		end

		def get_people
			parser.parse
		end

		def finder(people)
			@finder ||= PersonFinder.new(people)
		end

		def validator(person)
			@validator ||= PersonValidator.new(person)
		end

		
	end

