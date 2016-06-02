# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'assignment/version'

Gem::Specification.new do |spec|
  spec.name          = "assignment"
  spec.version       = Assignment::VERSION
  spec.authors       = ["Chase McCarthy"]
  spec.email         = ["chase@code0100fun.com"]

  spec.summary       = %q{Simple attribute assignment.}
  spec.description   = %q{Just attribute assignment. Stolen 100% from ActiveModel.}
  spec.homepage      = "https://github.com/code0100fun/assignment"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "indifference", "~> 0.0.1"
end
