class Parser
  attr_reader :plateau_size, :instructions

  def initialize(file)
    @lines = file.to_a
    file.close
  end

  def parse!
    @plateau_size = parse_plateau_size(@lines.first) 
    @instructions = parse_instructions(@lines.drop(1)) 
  end

  def parse_plateau_size(line)
    line.split(" ").map &:to_i
  end

  def parse_instructions(lines)
    tokenized_lines = lines.map { |line| line.split(%r{\s*}) }
    Hash[*tokenized_lines]
  end
end
