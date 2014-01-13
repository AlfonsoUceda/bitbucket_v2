module BitbucketV2
  module Models
    class User < Base
      USERS_ENDPOINT = "/users"

      def followers
        self.class.make_request hashie.links.followers.href, model: :User
      end

      def following
        self.class.make_request hashie.links.following.href, model: :User
      end

      def repositories
        self.class.make_request hashie.links.repositories.href, model: :Repository
      end
      
      class << self

        def find_by_username(username)
          make_request "#{USERS_ENDPOINT}/#{username}", model: :User
        end
      end
    end
  end
end