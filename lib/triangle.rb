class Triangle
  attr_reader :a, :b, :c
  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def kind
    validate_triangle
    #returns :equilateral when all sides are equal
    if a == b && b == c
      :equilateral
      #returns :isosceles when any two sides are equal
    elsif a == b || b == c || a == c
      :isosceles
      #returns :scalene when no sides are equal
    else
      :scalene
    end
  end

  def validate_triangle
    # raises an error for triangles with no size
    # raises an error for triangles with negative sides
    # raises an error for triangles violating triangle inequality
    real_triangle = [(a + b > c), (a + c > b), (b + c > a)]
    [a, b, c].each { |s| real_triangle << false if s <= 0 }
    
    raise TriangleError if real_triangle.include?(false)
  end

  class TriangleError < StandardError
  end

  
end
