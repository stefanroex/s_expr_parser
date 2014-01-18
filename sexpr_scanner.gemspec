# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 's_expr_parser/version'

Gem::Specification.new do |spec|
  spec.name          = "sexpr_scanner"
  spec.version       = SExprParser::VERSION
  spec.authors       = ["Stefan Roex"]
  spec.email         = ["info@stefanroex.nl"]
  spec.summary       = "S-Expression Parser using the Ruby StringScanner"
  spec.description   = ""
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
