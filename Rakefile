# encoding: utf-8

require "bundler/gem_tasks"
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs.concat %w(redis_throttle spec)
  t.patten = 'spec/**/*_spec.rb'
end
