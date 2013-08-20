require "hapax/version"
require "hapax/word_checker"
require "hapax/finder"

module Hapax
  def self.find(words)
    Finder.new(words).hapaxes
  end
end
