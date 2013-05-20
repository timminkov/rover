require 'rover_instructions'

file = File.new("instructions.txt")
rover = RoverInstructions.new(file)
rover.run
puts rover.rovers
