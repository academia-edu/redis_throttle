require 'spec_helper'

module RedisThrottle
  describe RedisThrottle do

    it "shouldn't run again while the lock is taken" do
      begin
        a = A.new
        a.run
        proc { a.run }.must_raise TriedToSleep
        a.i.must_equal 1
      ensure
        clear_lock
      end
    end

    it "should run again when the lock is gone" do
      begin
        a = A.new
        a.run
        clear_lock
        a.run
        a.i.must_equal 2
      ensure
        clear_lock
      end
    end

    it "should set an expire on the lock" do
      begin
        a = A.new
        a.run
        lock_pttl.must_equal 50
      ensure
        clear_lock
      end
    end

  end
end
