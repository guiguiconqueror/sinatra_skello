require 'sass/plugin/rack'
use Sass::Plugin::Rack

Sass::Plugin.options[:style] = :compressed

# Sass::Plugin.options[:css_location] = 'public/'

require './app.rb'
run Sinatra::Application
