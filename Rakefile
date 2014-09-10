# encoding: utf-8

require 'bundler/gem_tasks'

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'test'
  test.pattern = 'test/**/*_test.rb'
  test.verbose = true
end

require 'yard'
require 'clever-ruby/version'
YARD::Rake::YardocTask.new do |t|
  t.files   = ['lib/**/*.rb']
  t.options = ['--title', "clever-ruby #{Clever::VERSION}",
               '--markup-provider', 'redcarpet',
               '--output-dir', 'doc']
end

require 'yardstick/rake/measurement'
Yardstick::Rake::Measurement.new(:'yard-coverage') do |measurement|
  measurement.output = 'yard_coverage.txt'
end

require 'yardstick/rake/verify'
Yardstick::Rake::Verify.new(:'yard-coverage-verify') do |verify|
  verify.threshold = 100
end

require 'rubocop/rake_task'

desc 'Run RuboCop on the lib directory'
RuboCop::RakeTask.new(:lint) do |task|
  task.patterns = ['lib/**/*.rb', 'test/**/*.rb']
end

task default: [] do
  Rake::Task[:test].execute
  Rake::Task[:lint].execute
  Rake::Task[:'yard-coverage'].execute
  Rake::Task[:'yard-coverage-verify'].execute
end
