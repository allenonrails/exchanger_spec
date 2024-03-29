require 'digest'

module Exchanger 
  module Utils 
    module Uid 
      def get_hash(*args)
        return unless args.any?

        Digest::MD5.hexdigest args.join(' ')
      end
    end
  end
end
