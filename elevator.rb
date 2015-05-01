##Eden Zik
#Elevators Assignment
#v1.0
#This is the elevator class, managing its own movement

class Elevator
	attr_reader :people, :capacity, :building, :queue, :direction

	#Initializes its propoerties
	def initialize(building, capacity)
		@people = []
		@elevator_max_persons = capacity
		@current_direction = :NONE
		@building = building
		@request_queue = []
	end

	#Places itself on a given floor initially
	def install(floor)
		@current_floor = floor
	end

	#In order to print itself
	def number
		"elevator"
	end

	#Queue of requets
	def queue
		@request_queue
	end

	#Progresses tick one time forward
	def tick
		return if direction.eql? :NONE
		next_floor = building.get_next_floor(@current_floor, @current_direction)
		puts next_floor.nil?
		next_floor.nil? ? switch_direction : @current_floor = next_floor
		people.each{|person| person.tick}
	end

	def switch_direction
		if direction.eql? :UP
			@current_direction = :DOWN
			return
		end
		@current_direction = :UP
	end

	def direction
		@current_direction
	end

	#Directs the elevator in a given direction
	def direct(destination)
		queue.push(destination)
		if direction.eql? :NONE
			@current_direction = queue.first
		end
	end

	#Calls the elevator to go to a given floor
	def call(direction)
		
	end

	def enter(person)
		if occupancy<=capacity
			people.push(person)
			return true
		end
		false
	end
	
	def capacity
		@elevator_max_persons
	end
	
	def occupancy
		people.size
	end

	def exit(person)
		@people.delete(person)
	end

	def floor
		@current_floor
	end

	def to_s
		"Elevator @#{floor.number}, #{direction}: [#{people.join(', ')}]"
	end

end
