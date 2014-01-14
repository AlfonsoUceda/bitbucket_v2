require 'rest-client'
require 'base64'
require 'oauth'

module BitbucketV2
  class Request

    DEFAULT_API_VERSION = "2.0".freeze

    class << self
      attr_accessor :username
      attr_accessor :password

      def set_basic_auth(auth)
        RestClient.reset_before_execution_procs
        @username = auth[:username]
        @password = auth[:password]
      end

      def set_oauth_auth(auth)
        clean_basic_auth
        consumer = OAuth::Consumer.new(auth[:consumer_key], 
                                      auth[:consumer_secret],
                                      site: base_url_with_version)
        access_token = OAuth::AccessToken.new consumer
        RestClient.add_before_execution_proc do |request, params|
          access_token.sign! request
        end
      end

      def request(url, params = {})
        method = params[:method] ? params.delete(:method) : :get
        url = full_uri(url, params.delete(:version))
        response = BitbucketV2::Response.new(self.new.public_send(method, url, params))
        BitbucketV2::Parser.new(response, model: params.delete(:model)).parse
      end

      private

      def full_uri(url, version)
        uri = base_url_with_version(version)
        path = url.gsub(uri, "")
        "#{uri}#{path}"
      end

      def base_url_with_version(version = DEFAULT_API_VERSION)
        "#{base_uri}/#{version_api(version)}"
      end

      def version_api(version = nil)
        return DEFAULT_API_VERSION unless version
        version
      end

      def base_uri
        "https://bitbucket.org/!api"
      end

      def clean_basic_auth
        username = nil
        password = nil
      end
    end

    def get(url, params = {})
      RestClient.get url, params.merge!(basic_auth)
    end

    def post(url, params = {})
      RestClient.post url, params.merge!(basic_auth)
    end

    def put(url, params = {})
      RestClient.put url, params.merge!(basic_auth)
    end

    def delete(url, params = {})
      RestClient.delete url, params.merge!(basic_auth)
    end

    private

    def basic_auth
      auth = 'Basic ' + Base64.encode64( "#{self.class.username}:#{self.class.password}" ).chomp
      { Authorization: auth }
    end
  end
end