module BitbucketV2
  module Models
    class Changeset < Base
      class << self
        def find_by_owner_and_slug_and_node(owner, slug, node)
          make_request "#{Repository::REPOSITORY_ENDPOINT}/#{owner}/#{slug}/changesets/#{node}", model: :Changeset
        end
      end
    end
  end
end