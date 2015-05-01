class Floor
	attr_reader :number, :people, :building

	include Comparable

	def <=>(anOther)
		@building.floor_height(self) <=> @building.floor_height(anOther)
  	end

	def initialize(building, number)
		@people = []
		@number = number
		@building = building
	end

	def enter(person)
		people.push(person)
		true
	end

	def exit(person)
		people.delete(person)
	end

	def tick
		people.each{|person| person.tick}
	end

	def elevators_going(direction)
		building.elevators_at_floor(self).select{
			|elevator| elevator.direction.eql? direction
		}
	end

	def to_s
		"Floor \##{number}: [#{people.join(', ')}] "
	end
	


end
