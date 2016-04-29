    class PersonValidator
   
    	attr_reader :person
    	def initialize(person)
    		@person = person
    		@errors = []
    	end

    	def valid_person?
    		validate_presence && validate_active && validate_uffmail
    	end

    	def error_messages
    		@errors.join("\n")
    	end

    	private

    	def validate_active
    		@errors << 'Você está inativo.' unless @person.active?
    		@person.active?
    	end

    	def validate_presence
    		@errors << 'Matrícula não encontrada' unless @person
    		@person
    	end

    	def validate_uffmail
            have_uffmail = @person.uffmail.include?'@id.uff.br'
    		valid = @person.active? && !have_uffmail
    		@errors << 'Você já tem Uffmail' unless valid
    		valid
    	end

    end