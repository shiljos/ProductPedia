# Load DSL and Setup Up Stages
require 'capistrano/setup'

# Includes default deployment tasks
require 'capistrano/deploy'
require 'capistrano/rails'
# Includes tasks from other gems included in your Gemfile
#
# For documentation on these, see for example:
#
#   https://github.com/capistrano/rvm
#   https://github.com/capistrano/rbenv
#   https://github.com/capistrano/chruby
#   https://github.com/capistrano/bundler
#   https://github.com/capistrano/rails
#
# require 'capistrano/rvm'
# require 'capistrano/rbenv'
# require 'capistrano/chruby'
# require 'capistrano/bundler'
# require 'capistrano/rails/assets'
# require 'capistrano/rails/migrations'

# Loads custom tasks from `lib/capistrano/tasks' if you have any defined.
import 'lib/capistrano/tasks/base.cap'
import 'lib/capistrano/tasks/nginx.cap'
import 'lib/capistrano/tasks/nodejs.cap'
import 'lib/capistrano/tasks/postgresql.cap'
import 'lib/capistrano/tasks/rbenv.cap'
import 'lib/capistrano/tasks/unicorn.cap'
Dir.glob('lib/capistrano/tasks/*.cap').each { |r| import r }
