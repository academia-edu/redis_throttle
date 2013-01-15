# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'redis_throttle/version'

Gem::Specification.new do |gem|
  gem.name          = "redis_throttling"
  gem.version       = RedisThrottle::VERSION
  gem.authors       = ["Ryan Lower", "Ryan Fitzgerald", "Dmitri Akatov"]
  gem.email         = ["ryan@academia.edu", "rfitz@academia.edu", "dmitri@academia.edu"]
  gem.description   = %q{Ensures method cannot run more than every x milliseconds}
  gem.summary       = %q{Ensures method cannot run more than every x milliseconds}
  gem.homepage      = ""
  gem.license       = "MIT"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}) { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "redis"

  gem.add_development_dependency "rake"

  gem.add_development_dependency "minitest"
  gem.add_development_dependency "mocha"
  gem.add_development_dependency "guard"
  gem.add_development_dependency "guard-minitest"
  gem.add_development_dependency "pry"
end
