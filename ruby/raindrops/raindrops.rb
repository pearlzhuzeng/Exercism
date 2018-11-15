class Raindrops
  DROP_SOUND_LOOKUP = {
    3 => "Pling",
    5 => "Plang",
    7 => "Plong"
  }

  def self.convert(number)
    result = sounds(number)
    return number.to_s if result.empty?
    result
  end

  def self.sounds(number)
    DROP_SOUND_LOOKUP.reduce('') do |output, (drop, sound)|
      output += sound if divisible_by?(number, drop)
      output
    end
  end

  def self.divisible_by?(number, divider)
    number % divider == 0
  end
end
