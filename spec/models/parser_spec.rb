require 'rails_helper'

describe Parser do 
	it 'can read people from the csv file' do

		path = "#{Rails.root}/spec/alunos.csv"

		someone = Person.new('Richard Miles Albright', '112083999', '2710-1010', 'milesalbright@gmail.com','' ,'Ativo')

		# Setup : creating a .csv file
		file = File.new(path, 'w')
		line = file.puts 'nome,matricula,telefone,email,uffmail,status' #escrevendo a linha de cabeçalho 
		file.puts "#{someone.name},#{someone.matricula},#{someone.telefone},#{someone.email},#{someone.uffmail},#{someone.status}" 
		file.close


		parser = Parser.new(path)

		people = parser.read_people

		expect(people.first).to eq(someone)

	end

end