module BitbucketV2
  module Models
    class Commit < Base
      def comments
        self.class.make_request hashie.links.comments.href, model: :Comment
      end

      def patch
        self.class.make_request hashie.links.patch.href, model: :Patch
      end

      def author
        self.class.make_request hashie.author.user.links.self.href, model: :User
      end

      def repository
        self.class.make_request hashie.repositories.links.self.href, model: :Repository
      end

      class << self
        def find_by_owner_and_slug_and_revision(owner, slug, revision)
          make_request "#{Repository::REPOSITORY_ENDPOINT}/#{owner}/#{slug}/commit/#{revision}", model: :Commit
        end
      end
    end
  end
end