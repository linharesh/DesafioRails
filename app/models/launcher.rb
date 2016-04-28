require_relative './parser'
require_relative 'config'
require_relative 'person_finder'
require_relative 'person_validator'
require_relative 'uffmail_options_generator'
require_relative 'uffmail'

	class Launcher
		
		def start
			registration = ask_registration
			person = get_person(registration)
			create_email_for person
		end

		private

		def create_email_for(person)
			if validator(person).valid_person?
				generate_email_for person
			else
				show_errors_for person
			end
		end

		def show_errors_for(person)
			puts validator(person).error_messages
		end

		def generate_email_for(person)
			generator = UffmailOptionsGenerator.new(person)
			options = generator.options
			input = choose_from options
			choice = options[input.to_i - 1] #OPTIMIZE
			Uffmail.create(person)
			puts "Parabéns! Seu Uffmail foi criado com a seguinte escolha: #{choice}"
		end

		def get_person(registration)
			people = parser.parse
			finder(people).find_by('matricula', registration)
		end

		def ask_registration
			puts 'Digite sua matrícula:'
			gets.chomp
		end

		def parser
			Parser.new(Config::PATH)
		end

		def finder(people)
			@finder ||= PersonFinder.new(people)
		end

		def validator(person)
			@validator ||= PersonValidator.new(person)
		end

		def choose_from(options)
			puts 'Digite a opção desejada:'
			options.each_with_index do |option, index|
				puts "#{index+1} - #{option}"
			end
			gets.chomp
		end
	end

Launcher.new.start