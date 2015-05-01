##Eden Zik
#Mazes Extra Credit Assignment
##v1.0
#Unit Testing
#This is unit testing with RSpec to show that a building can be made
#Tests are self documented by their "it" clauses in Rspec.
#To run:
# $ rspec test.rb
# From the base directory

require_relative "simulation.rb"
require "rspec/expectations"

RSpec.describe Building do
	it "should be able to be simulated" do
		s = Simulation.new
		s.run(20)
	end
end
