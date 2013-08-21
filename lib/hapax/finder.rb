require "sep"

module Hapax
  class Finder
    attr_reader :words, :hapaxes

    def initialize(text)
      @sep             = Sep.load(text)
      @words           = @sep.words
      @already_checked = []

      find_hapaxes
    end

    private

    def find_hapaxes
      @hapaxes = []

      words.each do |word|
        @word = word

        if not_already_checked? and occurs_once?
          save_hapax
        end
      end
    end

    def occurs_once?
      words.map(&:downcase).count(@word.downcase) == 1
    end

    def not_already_checked?
      !@already_checked.include?(@word.downcase).tap { mark_as_checked }
    end

    def mark_as_checked
      w = @word.downcase

      @already_checked << w unless @already_checked.include?(w)
    end

    def save_hapax
      @hapaxes << @word
    end
  end
end
