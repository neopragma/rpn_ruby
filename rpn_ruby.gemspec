# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rpn_ruby/version'

Gem::Specification.new do |spec|
  spec.name          = "rpn_ruby"
  spec.version       = RPN::VERSION
  spec.authors       = ["Dave Nicolette"]
  spec.email         = ["davenicolette@gmail.com"]
  spec.summary       = %q{Reverse Polish Notation calculator}
  spec.description   = %q{Processes arithmetic expressions in postfix notation}
  spec.homepage      = "http://github.com/neopragma/rpn_ruby"
  spec.license       = "GNU General Public License (GPLv3)"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = []
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rubocop", '~> 0'
end