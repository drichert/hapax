module Hapax
  class Finder
    attr_reader :words

    def initialize(words)
      @words = words
    end

    def find
      norm = normalized_words

      @hapaxes ||= [].tap do |h|
        @words.each do |w|
          h << w if norm.count(w.downcase) == 1 && !h.include?(w)
        end
      end
    end

    private

    def normalized_words
      @words.map {|w| w.downcase }
    end
  end
end
