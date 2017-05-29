# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'logging/validation/errors/version'

Gem::Specification.new do |spec|
  spec.name          = "logging-validation-errors"
  spec.version       = Logging::Validation::Errors::VERSION
  spec.authors       = ["y-yoshinoya"]
  spec.email         = ["y-yoshinoya@ase.co.jp"]

  spec.summary       = %q{Validation errors for logging}
  spec.description   = %q{Validation errors for logging}
  spec.homepage      = "https://github.com/y-yoshinoya/logging-validation-errors"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_dependency "activerecord", "> 3.0"
end
