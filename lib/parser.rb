class Parser
  attr_reader :plateau_size, :instructions, :file_array

  def initialize(file)
    @file = file
    @file_array = []
  end

  def parse!
    self.to_array
    self.plateau_size!
    self.clean_up_array!
    self.to_hash
  end

  def to_array
    @file.each do |line|
      @file_array << line 
    end
    @file.close 
    @file_array
  end

  def clean_up_array!
    @file_array.map! { |line| line.split(%r{\s*}) } 
  end

  def plateau_size!
    @plateau_size = @file_array.slice!(0).split 
    @plateau_size.map! { |pos| pos.to_i }
  end

  def to_hash
    @instructions = Hash[*@file_array]
  end
end
