require './elevator'
require './person'
require './elevator'
require './floor'
require 'faker'

##Eden Zik
#Elevators Assignment
#v1.0
#This is the building class, controlling all aspects of floor elevator coordinations, as well as filling itself with people.


class Building
	attr_reader :elevators, :floors

	#Creates elevators, and floors. Places elevators on floors
	def initialize(number_of_elevators, number_of_floors, elevator_capacity,elevator_resting_floor)
		puts "Setting up #{number_of_elevators} elevators of capacity #{elevator_capacity}"
		@elevators = Array.new(number_of_elevators).map{
			|elevator| Elevator.new(self, elevator_capacity)
		}
		puts "Setting up #{number_of_floors} floors"
		@floors = Array.new(number_of_floors).each_with_index.map{
			|floor, height|Floor.new(self, height)
		}
		puts "Placing elevators on floor #{elevator_resting_floor}"
		@elevators.map{
			|elevator| elevator.install(@floors[elevator_resting_floor])
		}
		puts "~~~~~~~~~~~~~~~~~~~~~~~~"
	end

	#Places random people in random places in the building
	def populate(occupancy)
		puts "Placing #{occupancy} people in the building"
		Array.new(occupancy).map{
			|person| Person.new(Faker::Name.first_name, floors.sample, floors.sample, self)
		}
	end

	#Progresses the clock one tick froward
	def tick
		@elevators.each{|elevator| elevator.tick}
		@floors.each{|floor| floor.tick}
	end
	
	#Height of a floor
	def floor_height(floor)
		floors.index(floor)
	end

	#Size of the building
	def height
		floors.size
	end

	#Lets a person enter on the first floor
	def enter(person)
		floors.first.enter(person)
	end

	#Gets the next floor in some direction. Null if none
	def get_next_floor(floor, direction)
		index = floor.number
		if direction.eql? :UP
			return floors[index+1]
		end
		if index-1 < 0
			return nil
		end
		floors[index-1]
	end

	#Gets the least recently used elevator
	def lru_elevator
		elevator = elevators.shift
		elevators.push(elevator)
		elevator
	end

	#Gets all the elevators at a specific floor
	def elevators_at_floor(floor)
		elevators.select{|elevator| elevator.floor.eql? floor}
	end

	#Calls an elevator
	def call_elevator(direction)
		elevator = lru_elevator
		elevator.direct(direction)
		elevator
	end

	def to_s
		floors.join("\n") + "\n----------\n" + elevators.join("\n") + "\n" +"\n==========\n"
	end

end
