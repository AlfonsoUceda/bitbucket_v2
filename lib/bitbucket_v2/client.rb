module BitbucketV2
  class Client

    attr_accessor :username, :password

    def initialize(options)
      Request.set_basic_auth(options[:basic_auth]) if options.has_key? :basic_auth
      Request.set_oauth_auth(options[:oauth_auth]) if options.has_key? :oauth_auth
    end

    def users
      Models::User
    end

    def teams
      Models::Team
    end

    def repositories
      Models::Repository
    end
  end
end