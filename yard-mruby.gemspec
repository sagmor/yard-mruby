# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yard/mruby/version'

Gem::Specification.new do |spec|
  spec.name          = "yard-mruby"
  spec.version       = YARD::MRuby::VERSION
  spec.authors       = ["Seba Gamboa"]
  spec.email         = ["me@sagmor.com"]

  spec.summary       = %q{Generate Yard documentation for MRuby projects.}
  spec.description   = %q{Generate Yard documentation for MRuby projects.}
  spec.homepage      = "https://github.com/sagmor/yard-mruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "yard", "~> 0.9.0"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
