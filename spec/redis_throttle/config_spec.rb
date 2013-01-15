require 'spec_helper'

module RedisThrottle
  describe RedisThrottle do
    it 'server can be configured' do
      RedisThrottle.configure do |config|
        config.redis = Redis.new
      end
      RedisThrottle.instance_variable_get('@redis').must_be_instance_of Redis
    end
  end
end
