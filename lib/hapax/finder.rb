require "sep"

module Hapax
  class Finder
    attr_reader :words, :hapaxes

    def initialize(text)
      @sep     = Sep.load(text)
      @words   = @sep.words
      @hapaxes = []
    end

    # Returns Celluloid::Future
    def find_for(word)
      word_checker = WordChecker.new(word, words, @hapaxes)
      word_checker.future.check_word
    end

    def hapaxes
      #words.map {|word| find_for(word).value }

      #wds = words.map {|w| find_for(w).value }

      #until ready?
      #  sleep(0.5)
      #end

      #until wds.all? {|w| w.is_a?(String) }
      #  #p wds
      #  sleep(1)
      #end

      #wds

      words.map(&:find_for)
      sleep(4)
      words.map {|w| find_for(w).value }
    end

    #def ready?
    #  @hapaxes.all? {|w| w.is_a?(String) }
    #end

    #def find
    #  # @words.map do |word|
    #  @words.each do |word|
    #    word_checker = WordChecker.new(word, words, @hapaxes)
    #    word_checker.future.check_word
    #  end
    #end

    #def find
    #  last_ndx = words.length - 1
    #  threads  = []

    #  @hapaxes ||= [].tap do |h|
    #    @words.each_with_index do |w, ndx|
    #      threads << Thread.new do
    #        p "#{ndx}:start"
    #        mutex.synchronize do    
    #          h << w if norm_words.count(w.downcase) == 1 && !h.include?(w)
    #        end
    #        p "#{ndx}:end"
    #      end
    #    end

    #    threads.each {|th| th.join }
    #  end
    #end

    #private

    #def occurs_once?(word)
    #  word.downcase!

    #  (norm_words.count(word) == 1).tap {|found|
    #    if found and !@hapaxes.include?(word)
    #      @hapaxes << word
    #    end
    #  }
    #end

    #def norm_words
    #  @words.map(&:downcase)
    #end
  end
end
