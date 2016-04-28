	class Person
		attr_reader :matricula, :name, :uffmail, :status
		def initialize(params)
			@matricula = params['matricula']
			@name = params['nome']
			@status = params['status']
			@uffmail = params['uffmail']
		end

		def active?
			status == 'Ativo'
		end
	end