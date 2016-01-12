# Zomato-Engine in Ruby Language
#Launch this Zomato-Engine.rb file in your command line to start the program


APP_ROOT = File.dirname(__FILE__)

#require File.join(APP_ROOT, 'lib', 'guide')

$:.unshift(File.join(APP_ROOT, 'lib'))
require 'guide'

guide = Guide.new('restaurants.txt')
guide.launch
