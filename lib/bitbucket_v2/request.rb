require 'httparty'

module BitbucketV2
  class Request
    include HTTParty
    base_uri 'bitbucket.org/api/2.0'

    class << self
      attr_accessor :username
      attr_accessor :password

      def request(url, params = {})
        method = params[:method] ? params.delete(:method) : :get
        response = self.new.public_send method, url, params
        BitbucketV2::Parser.new(response, model: params.delete(:model)).parse
      end
    end

    def get(url, params = {})
      self.class.get url, params.merge!(basic_auth)
    end

    def post(url, params = {})
      self.class.post url, params.merge!(basic_auth)
    end

    def put(url, params = {})
      self.class.put url, params.merge!(basic_auth)
    end

    def delete(url, params = {})
      self.class.delete url, params.merge!(basic_auth)
    end

    private

    def basic_auth
      { basic_auth: { username: self.class.username, 
                      password: self.class.password } }
    end
  end
end