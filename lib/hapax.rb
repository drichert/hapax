require "hapax/version"
require "hapax/finder"

module Hapax
  def self.find(text)
    Finder.new(text).hapaxes
  end
end
