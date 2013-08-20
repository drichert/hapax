require "celluloid"

class WordChecker
  include Celluloid

  attr_reader :word, :words

  # word    - word to search for
  # words   - word list to check against
  # hapaxes - hapaxes array to send found hapax to
  def initialize(word, words, hapaxes)
    #p words, words, hapaxes

    @word    = word.downcase
    @words   = words.map(&:downcase)
    @hapaxes = hapaxes
  end

  def check_word
    (words.count(word) == 1).tap do |found|
      if found and !@hapaxes.include?(word)
        @hapaxes << word
      end
    end

    terminate
  end
end
