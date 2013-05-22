class Parser
  attr_accessor :plateau_size, :file_array
  def initialize(file)
    @file = file
    @file_array = []
  end

  def to_array
    @file.each do |line|
      @file_array << line 
    end
    @file.close 
    @file_array
  end

  def plateau_size!
    @plateau_size = @file_array.slice!(0).split 
    @plateau_size.map { |pos| pos.to_i }
  end
end
