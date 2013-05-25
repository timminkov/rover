require 'rover'
require 'parser'
require 'plateau'

class Runner
  def self.run(file)
    plateau_size, instructions = Runner.parse_file(file)
    plateau = Plateau.new(*plateau_size)
    Runner.deploy_rovers(plateau, instructions).map { |arr| arr.join(" ") }
  end 

  def self.parse_file(file)
    parser = Parser.new(file)
    parser.parse!
    [parser.plateau_size, parser.instructions]
  end

  def self.deploy_rovers(plateau, instructions)
    rovers = []
    instructions.each_pair do |loc, dir|
      rover = Runner.create_rover(loc)
      rovers << Runner.send_instructions(rover, plateau, dir) 
    end
    rovers
  end

  def self.send_instructions(rover, plateau, instructions)
    instructions.each do |instruction| 
      rover.receive_instruction!(instruction)
      return ["This rover went out of bounds!"] unless plateau.is_a_valid_move?(rover.location[0], rover.location[1]) 
    end
    rover.location
  end

  def self.create_rover(loc)
    Rover.new(loc[0].to_i, loc[1].to_i, loc[2])
  end
end
