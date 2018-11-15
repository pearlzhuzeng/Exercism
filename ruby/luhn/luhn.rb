class Luhn
  attr_reader :number

  def self.valid?(number)
    new(number).valid?
  end

  def initialize(number)
    @number = number
  end

  def valid?
    return false if has_non_digits?
    return false if single_digit?

    valid_luhn_sum?
  end

  private

  def has_non_digits?
    number.match(/[^\d\s]/)
  end

  def single_digit?
    digits.length <= 1
  end

  def valid_luhn_sum?
    luhn_sum % 10 == 0
  end

  def digits
    @digits ||= number.scan(/\d/).map(&:to_i)
  end

  def luhn_sum
    digits.reverse_each.with_index.sum do |n, i|
      n = n * 2 if i.odd?
      n = n - 9 if n > 9
      n
    end
  end
end
