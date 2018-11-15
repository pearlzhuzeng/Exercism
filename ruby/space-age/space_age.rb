class SpaceAge
  EARTH_YEAR = 31557600.0

  ORBITAL_PERIODS_IN_EARTH_YEARS = {
    earth: 1,
    mercury: 0.2408467,
    venus: 0.61519726,
    mars: 1.8808158,
    jupiter: 11.862615,
    saturn: 29.447498,
    uranus: 84.016846,
    neptune: 164.79132
  }.freeze

  attr_reader :age_on_earth

  def initialize(seconds)
    @age_on_earth = seconds / EARTH_YEAR
  end

  ORBITAL_PERIODS_IN_EARTH_YEARS.each do |planet, proportion|
    define_method("on_#{planet}") do #example: on_mars
      age_on_earth / proportion
    end
  end
end
