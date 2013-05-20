require 'rover'

describe Rover do
  describe "#new" do
    it "is created with a location/heading" do
      rover = Rover.new(0, 0, 'N').location.should == [0,0,'N']
    end
  end

  describe "#turn_left" do
    { 'N' => 'W',
      'W' => 'S',
      'S' => 'E',
      'E' => 'N'}.each do |start, left|
      it "sets the rover to face #{left} when facing #{start}" do
        rover = Rover.new(0, 0, start)
        rover.turn_left
        rover.location.should == [0, 0, left]
      end
    end
  end

  describe "#turn_right" do
    { 'N' => 'E',
      'E' => 'S',
      'S' => 'W',
      'W' => 'N'}.each do |start, right|
      it "sets the rover to face #{right} when facing #{start}" do
        rover = Rover.new(0, 0, start) 
        rover.turn_right
        rover.location.should == [0, 0, right]
      end
    end
  end

  describe "#move" do
    { 'N' => [1, 2, 'N'],
      'W' => [0, 1, 'W'],
      'S' => [1, 0, 'S'],
      'E' => [2, 1, 'E']}.each do |heading, location|
      it "puts the rover at #{location} for heading #{heading} at starting 1,1" do
        rover = Rover.new(1, 1, heading)
        rover.move
        rover.location.should == location
      end
    end
  end
end
