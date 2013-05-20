require 'rover'

class RoverInstructions
  attr_accessor :rovers

  def initialize(file)
    @file = file
    @rovers = []
  end

  def run
    @file.each do |line|
      if is_i?(line[0])  
        args = line.split
        @rover = Rover.new(args[0].to_i, args[1].to_i, args[2])
      else
        args = line.split
        args.each do |move|
          if move == 'L'
            @rover.move_left
          elsif move == 'R'
            @rover.move_right
          else
            @rover.move
          end
        end
       @rovers << @rover.location 
      end
    end
  end

  private

  def is_i?(char)
    return true if char =~ /^[-+]?[0-9]+$/
  end
end
