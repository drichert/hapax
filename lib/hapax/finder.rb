require "sep"

module Hapax
  class Finder
    attr_reader :words, :hapaxes

    def initialize(text)
      @sep     = Sep.load(text)
      @words   = @sep.words

      find_hapaxes
    end

    private

    def find_hapaxes
      @hapaxes = []

      words.each do |word|
        @word = word

        if occurs_once? and not_already_found?
          save_hapax
        end
      end
    end

    def occurs_once?
      words.map(&:downcase).count(@word.downcase) == 1
    end

    def not_already_found?
      !hapaxes.include?(@word.downcase)
    end

    def save_hapax
      @hapaxes << @word
    end
  end
end
