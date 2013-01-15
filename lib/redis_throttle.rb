require 'redis'
require "redis_throttle/version"

module RedisThrottle

  def self.configure
    yield self
  end

  def self.redis=(server)
    @redis = server
  end

end
