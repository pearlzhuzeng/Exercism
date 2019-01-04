class Card
  attr_reader :name, :number, :suit

  LETTER_NUMBER_PAIRS = {
    '1' => 10,
    'J' => 11,
    'Q' => 12,
    'K' => 13,
    'A' => 14
  }

  def initialize(name)
    @name = name
    @suit = name.slice(-1)

    value = name.split('')[0]
    @number = LETTER_NUMBER_PAIRS[value] || value.to_i
  end
end
