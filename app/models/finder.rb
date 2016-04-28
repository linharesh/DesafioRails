class Finder
	attr_reader :collection
	def initialize(collection)
		@collection = collection
	end

	def find_by(key, value)
		collection.find {|item| item[key.to_s] == value} 	
	end

end