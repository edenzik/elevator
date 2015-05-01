##Eden Zik
#Elevators Assignment
#v1.0
#This is the person class, capable of making decisions to access different places in the building or go on elevators.


class Person
	attr_reader :name, :building, :destination
	attr_accessor :location
	def initialize(name, current_floor, intended_floor, building)
		@name = name
		@building = building
		@destination = intended_floor
		@location = current_floor	#Can be elevator or floor
		current_floor.enter(self)
	end


	def direction
		location < destination ? :UP : :DOWN
	end

	def call_elevator
		building.call_elevator(direction)
	end

	def enter(new_location)
		if new_location.enter(self)
			location.exit(self)
			@location = new_location
		end
	end

	def arrived
		location.eql? destination
	end

	def tick
		if location.is_a? (Floor)
			if arrived
				puts "#{name} is leaving!"
				location.exit(self)
			end
			elevators_going = location.elevators_going(direction)
			if elevators_going.empty?
				building.call_elevator(direction)
				return
			end
			puts "#{name} is entering an elevator!"
			enter(elevators_going.pop)
			return
		end
		if location.is_a? (Elevator)
			if location.floor.eql? destination
				enter(location.floor)
			end
		end

	end


	def to_s
		"#{@name} at #{location.number} => #{destination.number}"
	end
end
