require 'redis'
require "redis_throttle/version"

module RedisThrottle

  def self.configure
    yield self
  end

  def self.redis=(server)
    @redis = server
  end

  def self.key(klass, method)
    "RedisThrottle:#{klass}##{method}"
  end

  # @param [Symbol] method name of the method to throttle
  # @param [Fixnum] millis by how much to throttle calls to the method
  #
  def redis_throttle(method, millis)
    key = RedisThrottle.key(self, method)
    define_method "#{method}_with_throttle" do |*args, &blk|
      if RedisThrottle.take_timed_lock key, millis
        send "#{method}_without_throttle", *args, &blk
      else
        sleep(millis/2000) # sleep half the throttle time
        redo
      end
    end
    alias_method "#{method}_without_throttle", method
    alias_method method, "#{method}_with_throttle"
  end

  # Sets a redis value with an expiry time, unless it's already set
  # @param key The redis key to set
  # @param [Fixnum] expire_time how long until the lock expires in milliseconds
  # @return [Boolean] true iff the key could be set (wasn't already set)
  #
  def self.take_timed_lock(key, expire_time)
    script = <<-LUA
      local success = redis.call('setnx', KEYS[1], 'hello')
      if (success == 1) then
        redis.call('pexpire', KEYS[1], ARGV[1])
      end
      return success
    LUA
    @redis.eval(script, [key], [expire_time]) == 1
  end


end
