require 'plateau'

describe Plateau do
  describe "is_a_valid_move?" do
    it "returns false for 5,6 on 5,5" do
      Plateau.new(5,5).is_a_valid_move?(5,6).should == false    
    end

    it "returns true for 4,5 on 5,5" do
      Plateau.new(5,5).is_a_valid_move?(4,5).should == true
    end
 
    it "returns false for 6, 5 on 5,5" do
      plateau = Plateau.new(5,5).is_a_valid_move?(6, 5).should == false
    end

    it "returns false for -1, 0 on 5,5" do
      plateau = Plateau.new(5, 5).is_a_valid_move?(-1, 0).should == false
    end
  end
end
