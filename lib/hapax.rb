require "hapax/version"
require "hapax/finder"

module Hapax
  def self.find(words)
    Finder.new(words).find
  end
end
