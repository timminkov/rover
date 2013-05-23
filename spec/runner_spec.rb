require 'runner'
require 'parser'

describe Runner do
  describe "#run" do
  end

  describe "#parse_file" do
    it "parses the file" do
      file = StringIO.new("5 5\n1 2 N\nLM")
      runner = Runner.new(file)
      runner.parse_file
      runner.instructions.should == { ['1', '2', 'N'] => ['L', 'M'] }
    end

    it "creates a plateau" do
      file = StringIO.new("5 5\n1 2 N\nLM")
      runner = Runner.new(file)
      runner.parse_file
    end
  end
end
