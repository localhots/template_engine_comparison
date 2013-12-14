$:.unshift File.dirname(__FILE__)

require 'rubygems'
require 'bundler/setup'
require 'benchmark'
require 'yaml'
require 'ostruct'

require 'erubis'
require 'haml'
require 'slim'
require 'liquid'
require 'mustache'
require 'tenjin'
require 'handlebars'
# require 'parkaby'
require 'tagz'
require 'tilt/erb'
require 'tilt/erubis'
require 'tilt/haml'
require 'tilt/liquid'

require 'workbench/benchmark'
require 'workbench/wrappers/base'
require 'workbench/wrappers/mustache'
require 'workbench/wrappers/slim'
require 'workbench/wrappers/tenjin'
require 'workbench/wrappers/handlebars'
require 'workbench/wrappers/parkaby'
require 'workbench/wrappers/tagz'
