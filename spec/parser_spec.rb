require 'parser'

describe Parser do
  describe "#to_array" do
    it "creates an array from a file" do
      file = StringIO.new("string")
      parser = Parser.new(file)
      parser.to_array.should == ["string"]
    end
  end

  describe "#plateau_size!" do
    it "pulls the first element of the array" do
      file = StringIO.new("5 5")
      parser = Parser.new(file)
      parser.to_array
      parser.plateau_size!.should == [5, 5] 
    end
  end

  describe "#parse!" do
    
  end  
end
