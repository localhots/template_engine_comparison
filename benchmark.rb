#!/usr/bin/env ruby

require 'rubygems'
require 'bundler/setup'
require 'benchmark'

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
RENDER_LOOPS = 10000

$templates = {}
$template_params = {title: 'Greetings!', username: '%username%'}

def path_for template
  File.expand_path('../templates/' + template, __FILE__)
end

def banner title
  puts '#' * TERMINAL_WIDTH
  puts '##' + title.center(TERMINAL_WIDTH - 4) + '##'
  puts '#' * TERMINAL_WIDTH
end

ENGINES = {
  erb: {
    class: Tilt::ERBTemplate,
    layout: path_for('erb/layout.erb')
  },
  erubis: {
    class: Tilt::ErubisTemplate,
    layout: path_for('erubis/layout.erubis')
  },
  haml: {
    class: Tilt::HamlTemplate,
    layout: path_for('haml/layout.haml')
  }
}

banner 'Compilation (%d runs)' % COMPILE_LOOPS
Benchmark.bm(TERMINAL_WIDTH - BM_WIDTH) do |x|
  ENGINES.each do |name, attrs|
    x.report(name) do
      COMPILE_LOOPS.times do
        $templates[name] = attrs[:class].new(attrs[:layout])
      end
    end
  end
end
puts

banner 'Render (%d runs)' % RENDER_LOOPS
Benchmark.bm(TERMINAL_WIDTH - BM_WIDTH) do |x|
  ENGINES.each do |name, attrs|
    x.report(name) do
      RENDER_LOOPS.times do
        $templates[name].render(Object, $template_params)
      end
    end
  end
end
