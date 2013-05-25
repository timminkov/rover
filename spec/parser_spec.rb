require 'parser'

describe Parser do
  describe "#parse!" do
    it "parses and readies a file to be used" do
      file = StringIO.new("5 5\n1 2 N\nLMRLM")
      parser = Parser.new(file)
      parser.parse!
      parser.plateau_size.should == [5, 5]
      parser.instructions.should == { ['1', '2', 'N'] => ['L', 'M', 'R', 'L', 'M'] }   
    end 

    it "parses multiple digit plateau sizes" do
      file = StringIO.new("10 10\n1 2 N\nLMRLM")
      parser = Parser.new(file)
      parser.parse!
      parser.plateau_size.should == [10, 10]
    end
  end  
end
