class Finder
	attr_reader :collection
	def initialize(collection)
		@collection = collection
	end

	def find_by(key, value)
		collection.find {|item| eval("item.#{key}") == value} 	
	end

end