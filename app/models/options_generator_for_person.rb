    class OptionsGeneratorForPerson
    	def initialize(person)
    		@person = person
    	end

    	def options
    		@person.name.split.map{|name| "#{name.downcase}@id.uff.br"}
    	end
    end