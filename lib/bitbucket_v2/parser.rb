module BitbucketV2
  class Parser

    attr_accessor :response, :options

    def initialize(response, options = {})
      @response = response
      @options = options
    end

    def parse
      if response.code < 400
        parse_response
      else
        error = response.parsed_response["error"]
        Error.new(error["message"], error["detail"])
      end
    end

    private

    def constantize_class(model)
      Kernel.const_get "BitbucketV2::Models::#{model}"
    end

    def parse_response
      klass = constantize_class(options[:model])
      unless response.parsed_response.has_key? "values"
        return klass.new response.parsed_response
      end
      response.parsed_response["values"].map do |value|
        klass.new value
      end
    end
  end
end