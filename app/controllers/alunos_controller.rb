require_relative '../models/person_manager'

class AlunosController < ApplicationController

	def show_all
		print 'passando pelo AlunosController#ShowAll'
		@people = PersonManager.instance.people
	end


end
