# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'clever-ruby/version'
require 'English'

Gem::Specification.new do |gem|
  gem.name          = 'clever-ruby'
  gem.version       = Clever::VERSION
  gem.authors       = ['Clever Dev']
  gem.email         = ['tech-support@clever.com']
  gem.description   = 'Ruby bindings to the Clever API.'
  gem.summary       = 'Ruby bindings to the Clever API.'
  gem.homepage      = 'http://github.com/Clever/clever-ruby'

  gem.required_ruby_version = '>= 1.9.3'
  gem.files         = `git ls-files`.split($RS)
  gem.executables   = gem.files.grep(/^bin\//).map { |f| File.basename f }
  gem.test_files    = gem.files.grep(/^(test|spec|features)\//)
  gem.require_paths = ['lib']

  gem.add_runtime_dependency 'multi_json',    '~> 1.10.0'
  gem.add_runtime_dependency 'rest-client',   '~> 1.6.7'
  gem.add_runtime_dependency 'activesupport', '>= 3.2.0', '< 4.3'

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'minitest',      '~> 5.4.1'
  gem.add_development_dependency 'yard',          '~> 0.8.7'
  gem.add_development_dependency 'yardstick',     '~> 0.9.9'
  gem.add_development_dependency 'redcarpet',     '~> 3.1.2'
  gem.add_development_dependency 'vcr',           '~> 2.9.3'
  gem.add_development_dependency 'minitest-vcr',  '~> 0.1.1'
  gem.add_development_dependency 'webmock',       '~> 1.9.0'
  gem.add_development_dependency 'rubocop',       '~> 0.26.0'
  gem.add_development_dependency 'appraisal',     '~> 1.0.2'
end
