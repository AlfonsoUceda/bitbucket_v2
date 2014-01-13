module BitbucketV2
  class Error < Struct.new(:message, :detail)
  end
end