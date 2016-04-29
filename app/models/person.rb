	class Person
		attr_reader :name, :matricula, :telefone, :email, :uffmail, :status
		
		def initialize(name, matricula, telefone, email, uffmail, status)
			@name = name
			@matricula = matricula
			@telefone = telefone
			@email = email
			@uffmail = uffmail
			@status = status
		end

		def active?
			status.include?'Ativo'
		end

		def description
			"Name: #{@name} | Registration: #{@matricula} | Tel: #{@telefone} | Email: #{@email} | Uffmail: #{@uffmail} | Status: #{@status}"
		end

		def set_uffmail uffmail
			@uffmail = uffmail
		end

	end