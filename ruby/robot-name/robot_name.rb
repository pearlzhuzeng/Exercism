require 'set'

class Robot

  A_CHARCODE = 65

  attr_reader :name

  def self.forget
    @@all = Set.new
  end

  forget

  def initialize
    reset
  end

  def reset
    loop do
      @name = random_name
      break unless @@all.include?(@name)
    end
    @@all << @name
  end

  private

  def random_name
    name = ''
    2.times { name << get_letter }
    3.times { name << get_number }
    name
  end

  def get_letter
    (rand(0...26) + A_CHARCODE).chr
  end

  def get_number
    rand(0..9).to_s
  end
end
