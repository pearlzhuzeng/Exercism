class Scrabble
  SCORE_BOARD = {
    "AEIOULNRST" => 1,
    "DG" => 2,
    "BCMP" => 3,
    "FHVWY" => 4,
    "K" => 5,
    "JX" => 8,
    "QZ" => 10
  }.each_with_object({}) do |(letters, score), accumulator|
    letters.each_char { |letter| accumulator[letter] = score}
  end

  def self.score(word)
    new(word).score
  end

  def initialize(word)
    word ||= ''
    @letters = word.upcase.scan(/\w/)
  end

  def score
    @letters.map { |letter| SCORE_BOARD[letter] }.sum
  end
end
