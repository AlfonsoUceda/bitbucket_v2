require 'hashie'

module BitbucketV2
  module Models
    class Base

      attr_accessor :hashie

      def initialize(attributes = {})
        @hashie = ::Hashie::Mash.new(attributes)
      end

      class << self
        def make_request(url, options = {})
          BitbucketV2::Request.request(url, options)
        end
      end
    end
  end
end