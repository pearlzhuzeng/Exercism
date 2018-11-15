module Hamming
  def self.compute(dna_1, dna_2)
    raise ArgumentError if dna_1.length != dna_2.length

    nucleotides_1 = dna_1.chars
    nucleotides_2 = dna_2.chars
    # nucleotides_1.each_with_index
    #          .select { |code, i| code != nucleotides_2[i] }
    #          .size

    nucleotides_1
      .zip(nucleotides_2)
      .count { |code_1, code_2| code_1 != code_2 }
  end
end
