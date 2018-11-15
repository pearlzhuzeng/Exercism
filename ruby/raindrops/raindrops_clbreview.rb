class Raindrops
  DROP_SOUND_LOOKUP = {
    3 => "Pling",
    5 => "Plang",
    7 => "Plong"
  }

  attr_reader :number

  def self.convert(number)
    new(number).call
  end

  def initialize(number)
    @number = number
  end

  def call
    sounds == '' ? number.to_s : sounds
    # sounds.tap { |result| return number.to_s if result.empty? } then don't need ||= below
  end

  def sounds
    @sounds ||= DROP_SOUND_LOOKUP.reduce('') do |output, (drop, sound)|
      output += sound if divisible_by?(drop)
      output
    end
  end

  def divisible_by?(divider)
    number % divider == 0
  end
end
