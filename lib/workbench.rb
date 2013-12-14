$:.unshift File.dirname(__FILE__)

require 'rubygems'
require 'bundler/setup'
require 'benchmark'
require 'yaml'
require 'ostruct'

require 'erubis'
require 'haml'
require 'handlebars'
require 'liquid'
require 'mustache'
require 'slim'
require 'tagz'

require 'tenjin'
require 'tilt/erb'
require 'tilt/erubis'
require 'tilt/haml'
require 'tilt/liquid'

require 'workbench/benchmark'
require 'workbench/wrappers/base'
require 'workbench/wrappers/handlebars'
require 'workbench/wrappers/mustache'
require 'workbench/wrappers/slim'
require 'workbench/wrappers/tagz'
require 'workbench/wrappers/tenjin'
