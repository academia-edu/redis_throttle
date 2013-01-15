# encoding: utf-8

require "minitest/spec"
require "minitest/autorun"
require "minitest/pride"

require "mocha/setup"

require "redis_throttle"

REDIS = Redis.new

RedisThrottle.configure do |config|
  config.redis = REDIS
end
