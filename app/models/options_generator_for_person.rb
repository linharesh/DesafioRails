    class OptionsGeneratorForPerson
    	def initialize(person)
    		@person = person
    	end

    	def options
    		opcoes = []
			nome = @person.name.split(/ /)
			random = rand(999).to_s
			opcoes << "#{nome.first.downcase}_#{nome.last.downcase}_#{random}@id.uff.br" 
			random = rand(999).to_s
			opcoes << "#{nome.last.downcase}_#{nome.first.downcase}_#{random}@id.uff.br"
			random = rand(999).to_s
			opcoes << "#{random}_#{nome.last.downcase}_#{nome.first.downcase}@id.uff.br"
			random = rand(999).to_s
			opcoes << "#{nome.first.downcase}#{nome.last.downcase}#{random}@id.uff.br"
			return opcoes
    	end
    end	