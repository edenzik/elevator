##Eden Zik
#Elevators Assignment
#v1.0
#This is the simulation class, in charge of running the overall simulation.
#Has constants, which dictate the properties of the building in question.

require './building'

class Simulation
	attr_reader :building

	ELEVATOR_CAPACITY = 20

	NUMBER_OF_ELEVATORS = 1
	
	NUMBER_OF_FLOORS = 10

	NUMBER_OF_PEOPLE = 5

	ELEVATOR_RESTING_FLOOR = 0

	#Initializer uses constants
	def initialize
		@building = Building.new(NUMBER_OF_ELEVATORS,NUMBER_OF_FLOORS,ELEVATOR_CAPACITY, ELEVATOR_RESTING_FLOOR)
		@building.populate(NUMBER_OF_PEOPLE)
	end

	#Runs the simulation for a specific number of ticks. Prints out the property at each tick
	def run(ticks)
		for i in 0..ticks
			puts building.to_s
			building.tick
		end
		puts building.to_s
	end

	def to_s
		building.to_s
	end

end

s = Simulation.new

s.run(20)



