require 'spec_helper'

module RedisThrottle
  describe VERSION do

    it 'is defined' do
      RedisThrottle::VERSION.wont_be_nil
    end

  end
end
