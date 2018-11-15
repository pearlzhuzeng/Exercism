class Squares
  def initialize(number)
    @natural_numbers = Array(1..number)
  end

  def square_of_sum
    @natural_numbers.sum ** 2
  end

  def sum_of_squares
    @natural_numbers.sum { |numb| numb ** 2 }
  end

  def difference
    square_of_sum - sum_of_squares
  end
end
