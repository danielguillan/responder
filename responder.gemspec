# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'responder/version'

Gem::Specification.new do |gem|
  gem.name          = "responder"
  gem.version       = Responder::VERSION
  gem.authors       = ["Daniel Guillan"]
  gem.email         = ["daniel.guillan@gmail.com"]
  gem.description   = %q{Magic media queries for your Compass project}
  gem.summary       = %q{Magic media queries for your Compass project}
  gem.homepage      = "http://github.com/danielguillan/responder"

  gem.files         = `git ls-files`.split($/)
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "sass", [">= 3.2.0"]
  gem.add_dependency "compass", [">= 0.12.2"]
  gem.add_dependency "rake"

end
