# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sss/version'

Gem::Specification.new do |spec|
  spec.name          = "sss"
  spec.version       = SSS::VERSION
  spec.authors       = ["Glauco Vinicius"]
  spec.email         = ["gl4uc0@gmail.com"]
  spec.summary       = %q{The SSS project ported to Ruby}
  spec.description   = %q{The SSS project ported to Ruby}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "thor"
  spec.add_dependency "racc"
  spec.add_dependency "rexical"

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
