require './hand'

# Determining the winner based on the five cards left in hand
class Poker
  attr_reader :hands

  def initialize(input)
    @hands = input.map { |h| Hand.new(h) }
  end

  def best_hand
    return [hands[0].combo] if one_hand?

    hands.map {|h| [h]}.reduce do |best_hand_so_far, hand|
      best_of_two_arrays_of_hands(best_hand_so_far, hand)
    end.map { |a| a.combo}
  end

  private

  def one_hand?
    hands.length == 1
  end

  def best_of_two_arrays_of_hands(arr1, arr2)
    return arr2 if arr1.first.rank > arr2.first.rank
    return arr1 if arr1.first.rank < arr2.first.rank

    pairs = arr1.first.high_cards.zip(arr2.first.high_cards)
    pairs.each do |pair|
      if pair[0] < pair[1]
        return arr2
      elsif pair[0] > pair[1]
        return arr1
      end
    end

    [arr1, arr2].flatten
  end
end
