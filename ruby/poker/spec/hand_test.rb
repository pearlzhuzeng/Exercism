require 'rspec'
require_relative '../hand'

RSpec.describe Hand do
  it "can be initialized" do
    h = Hand.new(%w(6S 8D 2H 4S 4H))
    expect(h.combo).to eq ['6S', '8D', '2H', '4S', '4H']
  end

  it "knows if it's straight" do
    h1 = Hand.new(%w(6S 7D 8H 9S 10H))
    h2 = Hand.new(%w(4S 4H 8S 8D 8H))
    h3 = Hand.new(%w(6S 7D 7H 9S 10H))
    h4 = Hand.new(%w(4D AH 3S 2D 5C))
    expect(h1.straight?).to be true
    expect(h2.straight?).to be false
    expect(h3.straight?).to be false
    expect(h4.straight?).to be true
  end

  it "knows if it's flush" do
    h1 = Hand.new(%w(6S 7D 8H 9S 10H))
    h2 = Hand.new(%w(4D 4D 8D 8D 8D))
    h3 = Hand.new(%w(6S 7S 7S 9S 10S))
    expect(h1.flush?).to be false
    expect(h2.flush?).to be true
    expect(h3.flush?).to be true
  end

  it "knows if it's straight and flush" do
    h1 = Hand.new(%w(6S 7D 8H 9S 10H))
    h2 = Hand.new(%w(6S 7S 8S 9S 10S))
    expect(h1.straight_flush?).to be false
    expect(h2.straight_flush?).to be true
  end

  it "knows the frequency of each number" do
    h1 = Hand.new(%w(6S 8D 2H 4S 4H))
    h2 = Hand.new(%w(4S 4H 8S 8D 8H))
    expect(h1.frequency).to eq ({6=>1, 8=>1, 2=>1, 4=>2})
    expect(h2.frequency).to eq ({4=>2, 8=>3})
  end

  it "knows if it's four of a kind" do
    h1 = Hand.new(%w(6S 6D 6H 6S 10H))
    h2 = Hand.new(%w(6S 7S 8S 9S 10S))
    expect(h1.four_of_a_kind?).to be true
    expect(h2.four_of_a_kind?).to be false
  end

  it "knows if it has three of a kind" do
    h1 = Hand.new(%w(6S 6D 6H 10S JH))
    h2 = Hand.new(%w(6S 7S 8S 9S 10S))
    expect(h1.three_of_a_kind?).to be true
    expect(h2.three_of_a_kind?).to be false
  end

  it "knows if it has a pair" do
    h1 = Hand.new(%w(6S 6D 8H 9S 10H))
    h2 = Hand.new(%w(6S 7S 8S JS 10S))
    expect(h1.pair?).to be true
    expect(h2.pair?).to be false
  end

  it "knows if it's full house" do
    h1 = Hand.new(%w(6S 6D 6H 10S 10H))
    h2 = Hand.new(%w(6S 7S 8S 9S 10S))
    expect(h1.full_house?).to be true
    expect(h2.full_house?).to be false
  end

  it "knows if it's a two-pair" do
    h1 = Hand.new(%w(6S 6D 8H 10S 10H))
    h2 = Hand.new(%w(6S 7S 8S 9S 10S))
    expect(h1.two_pairs?).to be true
    expect(h2.two_pairs?).to be false
  end

  it "knows its rank" do
    h1 = Hand.new(%w(6S 6D 8H 10S 10H))
    expect(h1.rank).to eq 7
  end

  it "knows the high cards" do
    h1 = Hand.new(%w(6S 7S 8S 9S 10S))
    h2 = Hand.new(%w(8S 8D 8H 8C 5H))
    h3 = Hand.new(%w(8S 8D 8H 9C 9H))
    h4 = Hand.new(%w(8D 6D 10D 9D KD))
    h5 = Hand.new(%w(8D 9D 10H JS QC))
    h6 = Hand.new(%w(9S 9D 9H JS QC))
    h7 = Hand.new(%w(5S 9D 5H 9S QC))
    h8 = Hand.new(%w(9S 9D 5H 6S QC))
    h9 = Hand.new(%w(9S 4D 5H 6S AC))

    expect(h1.high_cards).to eq [6]
    expect(h2.high_cards).to eq [8, 5]
    expect(h3.high_cards).to eq [8]
    expect(h4.high_cards).to eq [13, 10, 9, 8, 6]
    expect(h5.high_cards).to eq [8]
    expect(h6.high_cards).to eq [9, 12, 11]
    expect(h7.high_cards).to eq [9, 5, 12]
    expect(h8.high_cards).to eq [9, 12, 6, 5]
    expect(h9.high_cards).to eq [14, 9, 6, 5, 4]
  end
end
