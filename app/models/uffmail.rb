require_relative 'person_manager'
require_relative 'parser'

	class Uffmail
		def self.create(matricula, uffmail)
			@people = PersonManager.instance.people
			@people.each_index { |index|
				if @people[index].matricula == matricula
				   @people[index].set_uffmail uffmail
				end
		 	}
		 	PersonManager.instance.people = @people
		 	parser = Parser.new
		 	parser.save_people
		end
	end