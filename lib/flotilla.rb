require 'pry'

class Flotilla
  attr_reader :name, :personnel, :ships

  def initialize(info)
    @name = info[:designation]
    @personnel = []
    @ships = []
  end

  def add_ship(ship)
    @ships << ship
  end

  def add_personnel(person)
    @personnel << person
  end

  def recommend_personnel(ship)
    personnel_with_requirements = @personnel.select do |person|
      person.specialties == ship.requirements.flat_map do |requirement|
        requirement.keys
      end
    end
    ship_requirement_num = ship.requirements.max_by do |requirement|
      requirement.values
    end
    personnel_with_requirements.select do |person|
      person.experience >= ship_requirement_num.values[0]
    end
  end

  def personnel_by_ship
    persons_by_ship = {}
    # binding.pry
    @ships.select do |ship|
      persons_by_ship[ship] = recommend_personnel(ship)
    end
    persons_by_ship
  end
end
