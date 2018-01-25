#!/usr/bin/env rake

require 'bundler/setup'

# rubocop rake task
desc 'Ruby style guide linter'
task :rubocop do
  sh 'rubocop -D'
end

# tests using Chef Delivery from ChefDK
desc 'Test using Chef Delivery'
task :delivery do
  sh 'chef exec delivery local verify'
end

# creates metadata.json
desc 'Create metadata.json from metadata.rb'
task :metadata do
  sh 'knife cookbook metadata from file metadata.rb'
end

# share cookbook to Chef community site
desc 'Share cookbook to community site'
task :share do
  sh 'knife cookbook site share coopr other'
end

# test-kitchen
begin
  require 'kitchen/rake_tasks'
  desc 'Run Test Kitchen integration tests'
  task :integration do
    Kitchen.logger = Kitchen.default_file_logger
    Kitchen::Config.new.instances.each do |instance|
      instance.test(:always)
    end
  end
rescue LoadError
  puts '>>>>> Kitchen gem not loaded, omitting tasks' unless ENV['CI']
end

# default tasks are quick, commit tests
task :default => %w(delivery)
