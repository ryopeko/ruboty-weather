# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruboty/weather/version'

Gem::Specification.new do |spec|
  spec.name          = "ruboty-weather"
  spec.version       = Ruboty::Weather::VERSION
  spec.authors       = ["Ryoichi SEKIGUCHI"]
  spec.email         = ["ryopeko+free@gmail.com"]
  spec.summary       = %q{An ruboty handler to weather from livedoor API}
  spec.homepage      = "https://github.com/ryopeko/ruboty-weather"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "ruboty", ">= 0.2.0"
  spec.add_dependency "faraday"
  spec.add_dependency "faraday_middleware"
  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
