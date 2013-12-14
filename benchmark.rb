#!/usr/bin/env ruby
require File.expand_path('../lib/workbench', __FILE__)

big_data_file = File.expand_path('../data/big.yml', __FILE__)

raise <<-AGRR unless File.exist?(big_data_file)
Big data file not found. Please generate it by running this:
$ ./fakedata.rb 10000 > data/big.yml
AGRR

Workbench::Benchmark.describe_engines(
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
)

templates = {}
small_data = {window_title: 'Greetings!', username: '%username%'}
big_data = YAML.load_file(big_data_file)

Workbench::Benchmark.new(loops: 1000, title: 'Compilation (small template) - 1.000 runs') do |name, attrs|
  template_path = File.expand_path('../templates/%s/small.%s', __FILE__) % [name, attrs[:extension]]
  templates[name] = attrs[:class].new(template_path)
end

Workbench::Benchmark.new(loops: 10000, title: 'Render (small template) - 10.000 runs') do |name, attrs|
  case name
  when :slim
    templates[name].render(OpenStruct.new(small_data))
  else
    templates[name].render(Object, small_data)
  end
end

Workbench::Benchmark.new(loops: 1000, title: 'Compilation (big template) - 1.000 runs') do |name, attrs|
  template_path = File.expand_path('../templates/%s/big.%s', __FILE__) % [name, attrs[:extension]]
  templates[name] = attrs[:class].new(template_path)
end

Workbench::Benchmark.new(loops: 50, title: 'Render (big template, 150KB data) - 50 runs') do |name, attrs|
  case name
  when :slim
    templates[name].render(OpenStruct.new(customers: big_data))
  else
    templates[name].render(Object, {customers: big_data})
  end
end
