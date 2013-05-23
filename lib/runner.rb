require 'rover'
require 'parser'
require 'plateau'

class Runner
  attr_reader :rovers, :instructions, :plateau

  def initialize(file)
    @file = file
    @rovers = []
  end

  def run
    self.parse_file
    self.deploy_rovers
    @rovers.map! do |arr| 
      if arr.class == Array 
        arr.join(" ") if arr.class == Array
      else
        arr
      end
    end
  end 

  def parse_file
    parser = Parser.new(@file)
    parser.parse!
    @plateau = Plateau.new(*parser.plateau_size)
    @instructions = parser.instructions
  end

  def deploy_rovers
    @instructions.each_pair do |loc, dir|
      rover = Rover.new(loc[0].to_i, loc[1].to_i, loc[2])
      dir.each do |direction|
        rover.turn_left if direction == 'L'
        rover.turn_right if direction == 'R'
        rover.move if direction == 'M'
      end
      if @plateau.is_a_valid_move?(rover.location[0], rover.location[1])
        @rovers << rover.location
      else
        @rovers << "This rover went out of bounds!"
      end 
    end
  end
end
