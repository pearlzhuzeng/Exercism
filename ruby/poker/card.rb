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
    value = name.split('')[0]
    @suit = name.slice(-1) 
    @number = LETTER_NUMBER_PAIRS.key?(value) ? LETTER_NUMBER_PAIRS[value] : value.to_i
  end
end
