module BitbucketV2
  module Models
    class Team < Base
      TEAMS_ENDPOINT = "/teams"

      def members
        self.class.make_request hashie.links.members.href, model: :User
      end

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
        def find_by_teamname(teamname)
          make_request "#{TEAMS_ENDPOINT}/#{teamname}", model: :Team
        end
      end
    end
  end
end