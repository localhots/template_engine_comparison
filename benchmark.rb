#!/usr/bin/env ruby

require 'rubygems'
require 'bundler/setup'
require 'benchmark'
require 'yaml'

require 'erubis'
require 'haml'
require 'tilt/erb'
require 'tilt/erubis'
require 'tilt/haml'

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

small_data = {title: 'Greetings!', username: '%username%'}
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

ENGINES = {
  erb: {
    class: Tilt::ERBTemplate,
    extension: 'erb'
  },
  erubis: {
    class: Tilt::ErubisTemplate,
    extension: 'erubis'
  },
  haml: {
    class: Tilt::HamlTemplate,
    extension: 'haml'
  }
}


banner 'Compilation (small) (%d runs)' % COMPILE_LOOPS
benchmark(loops: COMPILE_LOOPS) do |name, attrs|
  template_path = File.expand_path('../templates/%s/small.%s', __FILE__) % [name, attrs[:extension]]
  templates[name] = attrs[:class].new(template_path)
end
puts

banner 'Render (small) (%d runs)' % RENDER_LOOPS
benchmark(loops: RENDER_LOOPS) do |name, attrs|
  templates[name].render(Object, small_data)
end
puts

banner 'Compilation (big) (%d runs)' % COMPILE_LOOPS
benchmark(loops: COMPILE_LOOPS) do |name, attrs|
  template_path = File.expand_path('../templates/%s/big.%s', __FILE__) % [name, attrs[:extension]]
  templates[name] = attrs[:class].new(template_path)
end
puts

banner 'Render (big) (%d runs)' % RENDER_LOOPS
benchmark(loops: 100) do |name, attrs|
  templates[name].render(Object, customers: big_data)
end
puts
