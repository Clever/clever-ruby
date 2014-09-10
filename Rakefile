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
YARD::Rake::YardocTask.new :doc

require 'yardstick/rake/measurement'
Yardstick::Rake::Measurement.new(:'doc-coverage') do |measurement|
  measurement.output = 'doc_coverage.txt'
end

require 'yardstick/rake/verify'
Yardstick::Rake::Verify.new(:'doc-coverage-verify') do |verify|
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
  Rake::Task[:'doc-coverage'].execute
  Rake::Task[:'doc-coverage-verify'].execute
end
