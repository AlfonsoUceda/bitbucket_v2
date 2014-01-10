require 'rest-client'

module BitbucketV2
  class Request
    def get(url, params = {})
      RestClient.get url, params
    end
  end
end