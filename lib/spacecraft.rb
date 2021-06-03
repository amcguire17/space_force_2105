class Spacecraft
  attr_reader :name, :fuel

  def initialize(info)
    @name = info[:name]
    @fuel = info[:fuel]
  end
end
