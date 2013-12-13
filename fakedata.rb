#!/usr/bin/env ruby

require 'rubygems'
require 'bundler/setup'
require 'yaml'
require 'faker'

if ARGV.first.to_i > 0
  num_records = ARGV.first.to_i
else
  num_records = 10
end

data = 1.upto(num_records).map do
  {
    'name' => Faker::Name.name,
    'age' => rand(20..50),
    'country' => Faker::Address.country,
    'city' => Faker::Address.city,
    'zip' => Faker::Address.zip.to_i,
    'address' => Faker::Address.street_address(true),
    'employer' => Faker::Company.name
  }
end

puts YAML.dump(data)
