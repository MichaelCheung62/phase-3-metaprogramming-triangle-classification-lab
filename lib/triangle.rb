class Triangle
  
  attr_accessor :equilateral, :isosceles ,:scalene

  def initialize(equilateral,isosceles,scalene)
    @equilateral = equilateral
    @isosceles = isosceles
    @scalene = scalene
  end
  
  def kind
    check_triangle
    if equilateral ==isosceles && isosceles == scalene
      :equilateral
    elseif equilateral == isosceles || isosceles == scalene || equilateral == scalene
      :isosceles
    else
      :scalene
    end
  end

  def sides_greater_than_zero?
    [equilateral,isosceles,scalene].all?(&:positive?)
  end

  def check_triangle_inequality?
    equilateral + isosceles > scalene && equilateral + scalene > isosceles && isosceles + scalene > equilateral
  end

  def check_triangle
    raise TriangleError unless sides_greater_than_zero && check_triangle_inequality?
  end
  
  

  class TriangleError < StandardError
  end
end
