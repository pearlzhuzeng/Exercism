require './card'

# Determin the type of each hand
class Hand
  attr_reader :combo

  def initialize(input)
    @combo = input
  end

  def cards
    combo.map { |c| Card.new(c) }
  end

  def numbers
    cards.map(&:number)
  end

  def suits
    cards.map(&:suit)
  end

  def straight?
    straight_from_A? || all_increments_by_one
  end

  def flush?
    suits.uniq.length == 1
  end

  def straight_flush?
    straight? && flush?
  end

  def four_of_a_kind?
    frequency.value?(4)
  end

  def three_of_a_kind?
    frequency.value?(3)
  end

  def pair?
    frequency.value?(2)
  end

  def full_house?
    three_of_a_kind? && pair?
  end

  def two_pairs?
    frequency.value?(2) && frequency.values.length == 3
  end

  def rank
    if straight_flush?
      1
    elsif four_of_a_kind?
      2
    elsif full_house?
      3
    elsif flush?
      4
    elsif straight?
      5
    elsif three_of_a_kind?
      6
    elsif two_pairs?
      7
    elsif pair?
      8
    else
      9
    end
  end

  def high_cards
    case
    when straight_flush?
      [numbers.sort.first]

    when four_of_a_kind?
      [frequency.key(4), frequency.key(1)]

    when full_house?
      [frequency.key(3)]

    when flush?
      numbers.sort.reverse

    when straight?
      [numbers.sort.first]

    when three_of_a_kind?
      numbers.sort.reverse.unshift(frequency.key(3)).uniq

    when two_pairs?
      frequency.keys
               .select { |k| frequency[k] == 2 }
               .sort.reverse
               .push(frequency.key(1))

    when pair?
      numbers.sort.reverse.unshift(frequency.key(2)).uniq

    else
      numbers.sort.reverse
    end
  end

  private

  def all_increments_by_one
    numbers.sort.each_cons(2).all? { |x, y| y == x + 1 }
  end

  def frequency
    numbers.each_with_object(Hash.new(0)) { |key, hash| hash[key] += 1 }
  end

  def straight_from_A?
    sorted_numbers = numbers.sort
    sorted_numbers.last == 14 && sorted_numbers.slice(0..3).each_cons(2).all? { |x, y| y == x + 1 }
  end
end
