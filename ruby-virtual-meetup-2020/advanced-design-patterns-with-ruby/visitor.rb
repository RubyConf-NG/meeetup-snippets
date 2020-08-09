module Visitor
  def visit(location)
    raise "I am unable to visit"
  end
end

module Building
  def welcome(visitor)
    raise "You are not a Visitor" unless visitor.is_a?(Visitor)
    raise "I am unable to welcome visitors right now."
  end
end

class Home
  include Building

  ACCEPTED_VISITORS = ["Bae", "ThatAunty"]

  def welcome(visitor)
    visitor_name = visitor.class.name
    if ACCEPTED_VISITORS.include?(visitor.class.name)
      visitor.visit(self)
    else
      puts "!!! #{self} rejects #{visitor_name}"
    end
  end

  def to_s
    self.class.name
  end
end

class Office
  include Building

  def welcome(visitor)
    visitor.visit(self)
  end

  def to_s
    self.class.name
  end
end

class ThatAunty
  include Visitor

  def visit(location)
    case location
    when Home
      puts "Cooking in the #{location}"
    when Office
      puts "Respecting myself in the #{location}"
    else
      raise "I cannot visit here yet"
    end
  end
end

class Bae
  include Visitor

  def visit(location)
    case location
    when Home
      puts "Netflix and Chill in the #{location}"
    when Office
      puts "Request to go for lunch in the #{location}"
    else
      raise "I cannot visit here yet"
    end
  end
end

class VillagePeople
  include Visitor

  def visit(location)
    case location
    when Home
      puts "Scattering the marriage in the #{location}"
    when Office
      puts "Recruiting enemy of progress in the #{location}"
    end
  end
end

# Main
buildings = [Home.new, Office.new]
aunty = ThatAunty.new
bae = Bae.new
village_people = VillagePeople.new
buildings.each do |building|
  building.welcome aunty
  building.welcome bae
  building.welcome village_people
  puts
end

# Remember Array#product
