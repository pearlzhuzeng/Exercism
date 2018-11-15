class Matrix
  attr_accessor :matrix_array

  def initialize(matrix_string)
    @matrix_array = matrix_string.split("\n")
  end

  def rows
    matrix_array.map { |row| to_numb_arr(row) }
  end

  def columns
    rows.transpose
  end

  private

  def to_numb_arr(arr)
    arr.split(" ").map { |numb| numb.to_i }
  end
end
