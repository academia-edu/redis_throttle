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

class TriedToSleep < RuntimeError
end

class ::A
  extend RedisThrottle
  attr_reader :i

  def initialize
    @i = 0
  end

  def run
    @i += 1
  end
  redis_throttle :run, 50

  def sleep(*)
    raise TriedToSleep
  end
end

def clear_lock
  REDIS.del RedisThrottle.key('A', 'run')
end

def lock_pttl
  REDIS.pttl RedisThrottle.key('A', 'run')
end
