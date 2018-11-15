class Phrase
  def initialize(phrase)
    @phrase = phrase
  end

  # def word_count
  #   @phrase.split(/ '|' |[^\w']+/).inject({}) do |count, word| # ^\w is the same as \W
  #     normalized_word = word.downcase
  #     next count unless normalized_word.length > 0 #the next interation, like return in js, and break would stop the iteration
  #     count[normalized_word] = (count[normalized_word] || 0) + 1
  #     count
  #   end
  # end

  def word_count
    @phrase.split(/ '|' |[^\w']+/).each_with_object(Hash.new(0)) do |word, counts| # ^\w is the same as \W
      normalized_word = word.downcase
      next unless normalized_word.length > 0 #the next interation, like return in js, and break would stop the iteration
      counts[normalized_word] += 1
    end
  end
end

=begin

class Phrase {
  constructor (phrase) {
    this.phrase = phrase
  }

  wordCount () {
    this.phrase.split(/ '|' |[^\w']+/).reduce((count, word) => {
      const normalizedWord = word.toUpperCase()
      if (!normalizedWord) return count
      count[normalizedWord] = (count[normalizedWord] || 0) + 1
      return count
    }, {})
  }
}

=end
