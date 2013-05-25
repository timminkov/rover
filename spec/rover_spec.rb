require 'rover'

describe Rover do
  describe "#receive_instruction" do
    context "#move" do
      { 'N' => [3, 4, 'N'],
        'S' => [3, 2, 'S'],
        'W' => [2, 3, 'W'],
        'E' => [4, 3, 'E']}.each do |nav, coord|
        it "moves #{nav} from 3,3 to #{coord}" do
          rover = Rover.new(3, 3, nav)
          rover.receive_instruction!('M')
          rover.location.should == coord
        end
      end
    end 

    

    context "turning left" do 
      { 'N' => 'W',
        'W' => 'S',
        'S' => 'E',
        'E' => 'N'}.each do |nav, turn_to|
        it "switches from #{nav} to #{turn_to}" do
          rover = Rover.new(0, 0, nav)
          rover.receive_instruction!('L')
          rover.location.should == [0, 0, turn_to]
        end
      end
    end
    
     
    context "turning right" do
      { 'N' => 'E',
        'E' => 'S',
        'S' => 'W',
        'W' => 'N'}.each do |nav, turn_to|
        it "switches from #{nav} to #{turn_to}" do
          rover = Rover.new(0, 0, nav)
          rover.receive_instruction!('R')
          rover.location.should == [0, 0, turn_to]
        end
      end
    end 
  end
end
