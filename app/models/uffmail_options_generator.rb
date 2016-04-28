require_relative 'options_generator_for_person'

    class UffmailOptionsGenerator
    	def initialize(subject, generator_class = OptionsGeneratorForPerson)
    		@subject = subject
    		@generator = generator_class.new(@subject)
    	end

    	def options
    		@generator.options
    	end
    end