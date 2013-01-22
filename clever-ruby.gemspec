# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'clever/version'

Gem::Specification.new do |gem|
  gem.name          = "clever-ruby"
  gem.version       = Clever::VERSION
  gem.authors       = ["Rafael Garcia", "Alex Zylman"]
  gem.email         = ["ruby@getclever.com"]
  gem.description   = %q{Ruby bindings to the Clever API.}
  gem.summary       = %q{Ruby bindings to the Clever API.}
  gem.homepage      = "http://github.com/Clever/clever-ruby"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency 'multi_json'
  gem.add_runtime_dependency 'rest-client'
  gem.add_development_dependency 'shoulda'
  gem.add_development_dependency 'rdoc'
end
