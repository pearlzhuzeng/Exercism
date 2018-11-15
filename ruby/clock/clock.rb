class Clock
  HOURS_IN_A_DAY = 24
  MINUTES_IN_AN_HOUR = 60

  def initialize(hour: 0, minute: 0)
    plus_hour, @minute = minute.divmod(MINUTES_IN_AN_HOUR)
    @hour = (hour + plus_hour) % HOURS_IN_A_DAY
  end

  def to_s
    format('%02d:%02d', hour, minute)
  end

  def +(other)
    self.class.new(hour: hour + other.hour, minute: minute + other.minute)
  end

  def -(other)
    self.class.new(hour: hour - other.hour, minute: minute - other.minute)
  end

  def ==(other)
    hour == other.hour && minute == other.minute
  end

  protected

  attr_reader :hour, :minute
end
