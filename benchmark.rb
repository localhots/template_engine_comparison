#!/usr/bin/env ruby
require File.expand_path('../lib/workbench', __FILE__)

big_data_file = File.expand_path('../data/big.yml', __FILE__)

raise <<-AGRR unless File.exist?(big_data_file)
Big data file not found. Please generate it by running this:
$ ./fakedata.rb 10000 > data/big.yml
AGRR

Workbench::Benchmark.describe_engines(
  builder: {
    class: Tilt::BuilderTemplate,
    extension: 'builder'
  },
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
  },
  handlebars: {
    class: Workbench::Wrappers::Handlebars,
    extension: 'handlebars'
  },
  liquid: {
    class: Tilt::LiquidTemplate,
    extension: 'liquid'
  },
  markaby: {
    class: Tilt::MarkabyTemplate,
    extension: 'mab'
  },
  mustache: {
    class: Workbench::Wrappers::Mustache,
    extension: 'mustache'
  },
  slim: {
    class: Workbench::Wrappers::Slim,
    extension: 'slim'
  },
  string: {
    class: Tilt::StringTemplate,
    extension: 'str'
  },
  tagz: {
    class: Workbench::Wrappers::Tagz,
    extension: 'rb'
  },
  tenjin: {
    class: Workbench::Wrappers::Tenjin,
    extension: 'rbhtml'
  },
)

templates = {}
small_data = {window_title: 'Greetings!', username: '%username%'}
big_data = YAML.load_file(big_data_file)

Workbench::Benchmark.new(loops: 1000, title: 'Compilation (small template) - 1.000 runs') do |name, attrs|
  template_path = File.expand_path('../templates/%s/small.%s', __FILE__) % [name, attrs[:extension]]
  templates[name] = attrs[:class].new(template_path)
end

Workbench::Benchmark.new(loops: 10000, title: 'Render (small template) - 10.000 runs') do |name, attrs|
  templates[name].render(Object, small_data)
end

Workbench::Benchmark.new(loops: 1000, title: 'Compilation (big template) - 1.000 runs') do |name, attrs|
  template_path = File.expand_path('../templates/%s/big.%s', __FILE__) % [name, attrs[:extension]]
  templates[name] = attrs[:class].new(template_path)
end

Workbench::Benchmark.new(loops: 50, title: 'Render (big template, 150KB data) - 50 runs') do |name, attrs|
  templates[name].render(Object, {customers: big_data})
end

# Cleanup Tenjin cache files
path = File.expand_path('../templates/tenjin/%s.rbhtml.cache', __FILE__)
File.delete(path % 'small') if File.exist?(path % 'small')
File.delete(path % 'big') if File.exist?(path % 'big')
