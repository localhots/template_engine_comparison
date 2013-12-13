#!/usr/bin/env ruby

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

# Terminal settings
TERMINAL_WIDTH = 60
BM_WIDTH = 46

# Benchmark settings
COMPILE_LOOPS = 1000
RENDER_LOOPS = 1000

templates = {}
big_data_file = File.expand_path('../data/big.yml', __FILE__)

unless File.exist?(big_data_file)
  raise 'Big data file not found. Please generate it with "./fakedata.rb 10000 > data/big.yml"'
end

small_data = {window_title: 'Greetings!', username: '%username%'}
big_data = YAML.load_file(big_data_file)

def banner title
  puts '#' * TERMINAL_WIDTH
  puts '##' + title.center(TERMINAL_WIDTH - 4) + '##'
  puts '#' * TERMINAL_WIDTH
end

def benchmark params
  raise 'No block given' unless block_given?

  Benchmark.bm(TERMINAL_WIDTH - BM_WIDTH) do |x|
    ENGINES.each do |name, attrs|
      x.report(name) do
        params[:loops].times{ yield(name, attrs) }
      end
    end
  end
end

module Wrappers
  class Base
    attr_reader :tpl

    def initialize path
      @tpl = File.read(path)
    end
  end

  class Mustache < Base
    def render context, args = {}
      ::Mustache.render(tpl, args)
    end
  end
end

ENGINES = {
  string: {
    class: Tilt::StringTemplate,
    extension: 'str'
  },
  erubis: {
    class: Tilt::ErubisTemplate,
    extension: 'erubis'
  },
  erb: {
    class: Tilt::ERBTemplate,
    extension: 'erb'
  },
  haml: {
    class: Tilt::HamlTemplate,
    extension: 'haml'
  },
  slim: {
    class: Slim::Template,
    extension: 'slim'
  },
  mustache: {
    class: Wrappers::Mustache,
    extension: 'mustache'
  },
  liquid: {
    class: Tilt::LiquidTemplate,
    extension: 'liquid'
  },
  markaby: {
    class: Tilt::MarkabyTemplate,
    extension: 'mab'
  },
  builder: {
    class: Tilt::BuilderTemplate,
    extension: 'builder'
  },
}

banner 'Compilation (small template) - 1.000 runs'
benchmark(loops: 1000) do |name, attrs|
  template_path = File.expand_path('../templates/%s/small.%s', __FILE__) % [name, attrs[:extension]]
  templates[name] = attrs[:class].new(template_path)
end
puts

banner 'Render (small template) - 10.000 runs'
benchmark(loops: 10_000) do |name, attrs|
  case name
  when :slim
    templates[name].render(OpenStruct.new(small_data))
  else
    templates[name].render(Object, small_data)
  end
end
puts

banner 'Compilation (big template) - 1.000 runs'
benchmark(loops: 1000) do |name, attrs|
  template_path = File.expand_path('../templates/%s/big.%s', __FILE__) % [name, attrs[:extension]]
  templates[name] = attrs[:class].new(template_path)
end
puts

banner 'Render (big template, 1.5MB data) - 30 runs'
benchmark(loops: 30) do |name, attrs|
  case name
  when :slim
    templates[name].render(OpenStruct.new(customers: big_data))
  else
    templates[name].render(Object, {customers: big_data})
  end
end
puts
