module BitbucketV2
  module Models
    class Base

      attr_accessor :hashie

      def initialize(attributes = {})
        @hashie = ::Hashie::Mash.new(attributes)
      end

      def method_missing(name, *args, &block)
        super unless hashie.respond_to?(name)
        hashie.send(name)
      end

      def respond_to_missing?(name, include_private = false)
        hashie.respond_to?(name)
      end

      class << self
        def make_request(url, options = {})
          BitbucketV2::Request.request(url, options)
        end
      end
    end
  end
end