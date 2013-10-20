class Phrase
  def initialize phrase
    @phrase = phrase
  end

  def word_count
    word_count_hash = Hash.new
    #binding.pry
    #
    @phrase.downcase.split(/[^\w+']/).delete_if(&:empty?).each do |word|
      if word_count_hash.key?(word)
        word_count_hash[word] = word_count_hash[word] + 1
      else
        word_count_hash[word] = 1 
      end
    end
    word_count_hash
  end


end
