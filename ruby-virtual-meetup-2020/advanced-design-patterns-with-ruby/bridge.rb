class DrawingAPI
  def draw_circle(x, y, radius)
    raise "Unimplemented"
  end
end

class DrawingAPI1 < DrawingAPI
  def draw_circle(x, y, radius)
    "API1.circle at #{x}:#{y} - radius: #{radius}"
  end
end

class DrawingAPI2 < DrawingAPI
  def draw_circle(x, y, radius)
    "API2.circle at #{x}:#{y} - radius: #{radius}"
  end
end

class Shape
  attr_reader :drawing_api

  def initialize(drawing_api)
    @drawing_api = drawing_api
  end

  def draw
    raise "Unimplemented"
  end

  def resize_by_percentage(percent)
    raise "Unimplemented"
  end
end

class CircleShape < Shape
  attr_reader :x, :y, :radius

  def initialize(x, y, radius, drawing_api)
    @x = x
    @y = y
    @radius = radius
    super(drawing_api)
  end

  def draw
    @drawing_api.draw_circle(@x, @y, @radius)
  end

  def resize_by_percentage(percent)
    @radius *= (1 + percent/100)
  end
end

class BridgePattern
  def self.show
    shapes = [
      CircleShape.new(1.0, 2.0, 3.0, DrawingAPI1.new),
      CircleShape.new(5.0, 7.0, 11.0, DrawingAPI2.new)
    ]

    shapes.each do |shape|
      shape.resize_by_percentage(2.5)
      puts shape.draw
    end
  end
end

BridgePattern.show
