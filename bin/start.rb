require 'runner'

f = File.open("bin/instructions.txt")
runner = Runner.new(f)
runner.run

puts runner.rovers
