module BitbucketV2
  module Models
    class PullRequests < Base
      def comments
        self.class.make_request hashie.links.comments.href, model: :Comment
      end

      def commits
        self.class.make_request hashie.links.commits.href, model: :Commit
      end

      def activity
        self.class.make_request hashie.links.activity.href, model: :Activity
      end
      
      class << self
        def find_by_owner_and_slug_and_pullid(owner, slug, pullid)
          make_request "#{Repository::REPOSITORY_ENDPOINT}/#{owner}/#{slug}/pullrequests/#{pullid}", model: :PullRequest
        end
      end
    end
  end
end