module SimpleFeed
  module Providers
    REQUIRED_METHODS = %i(store remove reset_last_read paginate all count unread_count)

    def self.define_provider_methods(klass, &block)
      # Methods on the class instance
      klass.class_eval do
        SimpleFeed::Providers::REQUIRED_METHODS.each do |m|
          define_method(m) do |*args, **opts|
            block.call(self, m, *args, **opts)
          end
        end
      end
    end
  end
end

require_relative 'providers/base'
require_relative 'redis/provider'
