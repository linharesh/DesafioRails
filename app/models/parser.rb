require 'csv'

class Parser
	attr_reader :path, :reader

	def initialize(path, reader = CSV)
		@path = path
		@reader = reader
	end

	def parse
		reader.read(path, headers: true)
	end

end