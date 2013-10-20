class Hamming

  def self.compute strand1, strand2

    nucleotides1 = strand1.chars
    nucleotides2 = strand2.chars

    paired_nucleotides = nucleotides1.zip(nucleotides2)

    paired_nucleotides.count do |first, second|
      first && second && first != second
    end

  end

end
