# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'clever-ruby/version'

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

  gem.add_runtime_dependency     'multi_json',    '~> 1.7.0'
  gem.add_runtime_dependency     'rest-client',   '~> 1.6.7'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'minitest',      '~> 4.4.0'
  gem.add_development_dependency 'shoulda',       '~> 3.3.2'
  gem.add_development_dependency 'rdoc',          '~> 3.12'
  gem.add_development_dependency 'vcr',           '~> 2.4.0'
  gem.add_development_dependency 'webmock',       '~> 1.9.0'
  gem.add_development_dependency 'pry',           '~> 0.9.9.6'
  gem.add_development_dependency 'activesupport', '~> 3.2.11'
end
