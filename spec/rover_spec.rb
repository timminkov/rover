require 'rover'

describe Rover do
  describe "#move" do
    { 'N' => [3, 4, 'N'],
      'S' => [3, 2, 'S'],
      'W' => [2, 3, 'W'],
      'E' => [4, 3, 'E']}.each do |nav, coord|
      it "moves #{nav} from 3,3 to #{coord}" do
        rover = Rover.new(3, 3, nav)
        rover.move
        rover.location.should == coord
      end
    end
  end
  
  describe "#turn_left" do
    { 'N' => 'W',
      'W' => 'S',
      'S' => 'E',
      'E' => 'N'}.each do |nav, turn_to|
      it "switches from #{nav} to #{turn_to}" do
        rover = Rover.new(0, 0, nav)
        rover.turn_left
        rover.location.should == [0, 0, turn_to]
      end
    end
  end
  
  describe "#turn_right" do
    { 'N' => 'E',
      'E' => 'S',
      'S' => 'W',
      'W' => 'N'}.each do |nav, turn_to|
      it "switches from #{nav} to #{turn_to}" do
        rover = Rover.new(0, 0, nav)
        rover.turn_right
        rover.location.should == [0, 0, turn_to]
      end
    end
  end 
end
