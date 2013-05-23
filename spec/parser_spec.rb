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

  describe "#to_hash!" do
    it "turns the array into a hash" do
      file = StringIO.new("line1\nline2")
      parser = Parser.new(file)
      parser.to_array
      parser.to_hash.should == { "line1\n" => "line2" } 
    end
  end

  describe "#clean_up_array!" do
    it "splits the array of strings into an array of arrays" do
      file = StringIO.new("line1\nline2")
      parser = Parser.new(file)
      parser.to_array
      parser.clean_up_array!
      parser.file_array.should == [["l","i","n","e","1"],["l","i","n","e","2"]]
    end
  end
  

  describe "#parse!" do
    it "parses and readies a file to be used" do
      file = StringIO.new("5 5\n1 2 N\nLMRLM")
      parser = Parser.new(file)
      parser.parse!
      parser.plateau_size.should == [5, 5]
      parser.instructions.should == { ['1', '2', 'N'] => ['L', 'M', 'R', 'L', 'M'] }   
    end 
  end  
end
