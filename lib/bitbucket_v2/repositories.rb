module BitbucketV2
  class Repositories
    def all
      Request.new.get("#{API_HOST}/repositories")
    end
  end
end