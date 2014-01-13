module BitbucketV2
  class Client

    attr_accessor :username, :password

    def initialize(username, password)
      Request.username = username
      Request.password = password
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