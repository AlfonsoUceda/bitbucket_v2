module BitbucketV2
  class Client
    def initialize(username, password)
      @username = username
      @password = password
    end

    def repositories
      Repositories.new
    end
  end
end