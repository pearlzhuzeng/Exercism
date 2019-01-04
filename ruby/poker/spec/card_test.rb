require 'rspec'
require_relative '../card'

RSpec.describe Card do
  it "can be initialized" do
    c1 = Card.new('7D')
    c2 = Card.new('10H')
    expect(c1.number).to eq (7)
    expect(c1.suit).to eq ('D')
    expect(c2.number).to eq (10)
  end

  it "can replace J with 11" do
    c = Card.new('JH')
    expect(c.number).to eq (11)
  end

  it "can replace Q with 12" do
    c = Card.new('QH')
    expect(c.number).to eq (12)
  end

  it "can replace K with 13" do
    c = Card.new('KH')
    expect(c.number).to eq (13)
  end

  it "can replace A with 14" do
    c = Card.new('AH')
    expect(c.number).to eq (14)
  end
end
