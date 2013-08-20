# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hapax/version'

Gem::Specification.new do |gem|
  gem.name          = "hapax"
  gem.version       = Hapax::VERSION
  gem.authors       = ["Dan Richert"]
  gem.email         = ["dan.richert@gmail.com"]
  gem.description   = %q{Find words that only occur once within a context}
  gem.summary       = %q{Find things said only once}
  gem.homepage      = "https://github.com/drichert/hapax"
  gem.license       = "MIT"

  gem.add_dependency("sep", "~> 0.0.3")
  gem.add_dependency("celluloid", "~> 0.14.1")

  gem.add_development_dependency("rspec")

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
