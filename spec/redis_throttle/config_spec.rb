require 'spec_helper'

module RedisThrottle
  describe RedisThrottle do

    it 'server can be configured' do
      RedisThrottle.instance_variable_get('@redis').must_be_instance_of Redis
    end

    it 'prefix_key can be configured' do
      begin
        RedisThrottle.configure do |config|
          config.key_prefix = 'prefix'
        end
        RedisThrottle.key('klass', 'method').must_equal 'prefix:klass#method'
      ensure
        RedisThrottle.instance_variable_set('@key_prefix',nil)
      end
    end

  end
end
