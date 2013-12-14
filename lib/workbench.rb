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
require 'tilt/erb'
require 'tilt/erubis'
require 'tilt/haml'
require 'tilt/liquid'

require 'workbench/benchmark'
require 'workbench/wrappers/base'
require 'workbench/wrappers/mustache'
