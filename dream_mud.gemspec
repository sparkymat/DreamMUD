# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dream_mud/version'

Gem::Specification.new do |spec|
  spec.name          = "dream_mud"
  spec.version       = DreamMUD::VERSION
  spec.authors       = ["Ajith Hussain"]
  spec.email         = ["csy0013@googlemail.com"]
  spec.description   = %q{Dream MUD is a next-gen, Ruby-based MUD codebase. It's structure is inspired by Rails.}
  spec.summary       = %q{Dream MUD is a next-gen, Ruby-based MUD codebase.}
  spec.homepage      = "https://github.com/sparkymat/DreamMUD"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
