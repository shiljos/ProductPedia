# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.
require 'ci/reporter/rake/rspec' 
require 'ci/reporter/rake/cucumber'

require File.expand_path('../config/application', __FILE__)

ProductPedia::Application.load_tasks
