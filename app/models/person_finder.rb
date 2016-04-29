require_relative 'finder'
require_relative 'person'

class PersonFinder < Finder
	def find_by(key, value)
		item = super
	end
end