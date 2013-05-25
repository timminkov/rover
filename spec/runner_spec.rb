require 'runner'

describe Runner do
  describe ".parse_file" do
    it "creates instrucions" do
      file = StringIO.new("5 5\n1 2 N\nLM")
      plateau, instructions = Runner.parse_file(file)
      instructions.should == { ['1', '2', 'N'] => ['L', 'M'] }
    end
  end

  describe ".create_rover" do
    it "creates rovers based on the location" do
      rover_location = ['1', '2', 'N']  
      rover = Runner.create_rover(rover_location)
      rover.location.should == [1, 2, 'N']
    end
  end

  describe ".send_instructions" do
    before(:each) do
      @rover = Rover.new(1, 2, 'N')
      @plateau = Plateau.new(3, 3)
    end

    it "returns the starting location for []" do
      Runner.send_instructions(@rover, @plateau, []).should == [1, 2, 'N']
    end

    it "performs a single move" do
      instructions = ['M']
      Runner.send_instructions(@rover, @plateau, instructions).should == [1, 3, 'N'] 
    end

    it "returns an error if rover goes out of obunds" do
      instructions = ['M', 'M'] 
      Runner.send_instructions(@rover, @plateau, instructions).should == ["This rover went out of bounds!"]
    end

    it "returns an error if rover goes out of bounds while following instructions" do
      instructions = ['M', 'M', 'L', 'L', 'M']
      Runner.send_instructions(@rover, @plateau, instructions).should == ["This rover went out of bounds!"]
    end
  end
end
