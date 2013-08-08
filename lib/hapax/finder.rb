require "thread"

module Hapax
  class Finder
    attr_reader :words

    def initialize(words)
      @words = words
    end

    def find
      norm     = normalized_words
      mutex    = Mutex.new
      last_ndx = norm.length - 1
      threads  = []

      @hapaxes ||= [].tap do |h|
        @words.each_with_index do |w, ndx|
          threads << Thread.new do
            p "#{ndx}:start"
            mutex.synchronize do    
              h << w if norm.count(w.downcase) == 1 && !h.include?(w)
            end
            p "#{ndx}:end"
          end
        end

        threads.each {|th| th.join }
      end
    end

    private

    def normalized_words
      @words.map {|w| w.downcase }
    end
  end
end
