#!/usr/bin/env ruby

require 'bundler'
require 'yaml'
require File.expand_path('../lib/glue.rb',  __FILE__)

config = YAML.load(ERB.new(File.read(File.expand_path('../config.yml',  __FILE__))).result)
g = Glue.new(config)

input_array = ARGV

if input_array.any?
  key = input_array[0]
  copy_to_clip_board = input_array.include? '-c'
  issue = g.jira.find_issue(key)

  puts g.build_branch_name_from_issue(issue, copy_to_clip_board) if issue
end