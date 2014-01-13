module BitbucketV2
  module Models
    class Repository < Base
      REPOSITORIES_ENDPOINT = "/repositories"

      def commits
        self.class.make_request hashie.links.commits.href, model: :Commit
      end

      def forks
        self.class.make_request hashie.links.forks.href, model: :Fork
      end

      def watchers
        self.class.make_request hashie.links.watchers.href, model: :User
      end

      def pull_requests(pull_request_id = nil)
        self.class.make_request hashie.links.pull_requests.href, model: :PullRequest
      end

      class << self
        def find_by_owner(owner)
          make_request "#{REPOSITORIES_ENDPOINT}/#{owner}", model: :Repository
        end

        def find_by_owner_and_slug(owner, slug)
          make_request "#{REPOSITORIES_ENDPOINT}/#{owner}/#{slug}", model: :Repository
        end

        def all
          make_request REPOSITORIES_ENDPOINT, model: :Repository
        end
      end
    end
  end
end