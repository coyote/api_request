# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'api_request/version'

Gem::Specification.new do |spec|
  spec.name          = "api_request"
  spec.version       = ApiRequest::VERSION
  spec.authors       = ["Craig A. Cook"]
  spec.email         = ["craig.a.cook@gmail.com"]
  spec.summary       = %q{A generic API client - Auth in headers}
  spec.description   = %q{Generic API client}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
