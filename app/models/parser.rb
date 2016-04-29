class Parser

	attr_reader :path

	def initialize(path="#{Rails.root}/alunos.csv")
		@path = path
	end

	def read_people
		file = File.new(path, 'r')
		line = file.gets # skipping the first line of the file 
		people = [] 

		while (line = file.gets)
			splittedline = line.split(/,/)
			person = Person.new(splittedline[0], splittedline[1], splittedline[2], splittedline[3], splittedline[4], splittedline[5])
			people.push(person)
		end

		file.close
		return people
	end

	def save_people
		file = File.new(path, 'w')
		line = file.puts 'nome,matricula,telefone,email,uffmail,status' #escrevendo a linha de cabeçalho 
		PersonManager.instance.people.each{ |person| file.puts "#{person.name},#{person.matricula},#{person.telefone},#{person.email},#{person.uffmail},#{person.status}" }
		file.close
	end

end