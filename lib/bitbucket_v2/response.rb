require 'json'

module BitbucketV2
  class Response

    attr_accessor :parsed_response
    attr_reader :response

    def initialize(response)
      @response = response
      @parsed_response = JSON.parse(response.body)
    end

    def code
      response.code
    end
  end
end