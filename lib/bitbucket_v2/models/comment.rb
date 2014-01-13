module BitbucketV2
  module Models
    class Comment < Base
      def author
        self.class.make_request hashie.user.links.self.href, model: :User
      end
    end
  end
end