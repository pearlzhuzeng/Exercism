class Grains
  FIRST_SQUARE = 1
  LAST_SQUARE = 64

  def self.square(number)
    raise(ArgumentError) if number < FIRST_SQUARE || number > LAST_SQUARE
    2 ** (number - 1)
  end

  def self.total
    (FIRST_SQUARE..LAST_SQUARE).sum { |number| square(number) }
  end
end
