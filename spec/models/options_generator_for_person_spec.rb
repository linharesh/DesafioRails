require 'rails_helper'

describe OptionsGeneratorForPerson do 
	
	it 'should generate 4 UFFMAIL options to a person' do
		someone = Person.new('Richard Miles Albright', '112083999', '2710-1010', 'milesalbright@gmail.com','' ,'Ativo')
		opts = options_generator = OptionsGeneratorForPerson.new(someone).options
		expect(opts.size).to eq(4) 
	end

end
