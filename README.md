# RedisThrottle

Ensures method cannot run more than every x milliseconds.

    class A
      extend RedisThrottle
      
      def run
        do something interesting
      end
      redis_throttle :run, 500
    end


## Installation

Add this line to your application's Gemfile:

    gem 'redis_throttle'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install redis_throttle


## Usage

Configure to use your redis

    RedisThrottle.configure do |config|
      config.redis = Redis.new(host: '1.2.3.4', port: 5678)
    end


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
