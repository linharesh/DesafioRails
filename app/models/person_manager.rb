require 'singleton'
require_relative 'person'
require_relative 'parser'

class PersonManager
	include Singleton

	attr_accessor :people

	def initialize
		@people = Parser.new.read_people
	end


end