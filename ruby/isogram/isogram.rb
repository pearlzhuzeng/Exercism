class Isogram
  def self.isogram?(word)
    normalized = word.upcase.gsub(/[\s-]/, "")
    normalized.chars.uniq.length == normalized.length
  end
end
