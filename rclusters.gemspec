# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rclusters/version'

Gem::Specification.new do |spec|
  spec.name          = "rclusters"
  spec.version       = RClusters::VERSION
  spec.authors       = ["Bruno Salerno"]
  spec.email         = ["br.salerno@gmail.com"]

  spec.summary       = 'Points clustering for Ruby based on distance.'
  spec.description   = 'RClusters creates clusters from a points hash using either pixel or surface distance calculations.'
  spec.homepage      = 'https://github.com/BrunoSalerno/rclusters'
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "geokit", "~> 1.9"
  spec.add_runtime_dependency "pixeldistance", "~> 0.2.1"

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
end
