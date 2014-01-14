require "bitbucket_v2/version"
require "hashie"

module BitbucketV2
  autoload :Client,   "bitbucket_v2/client"
  autoload :Error,    "bitbucket_v2/error"
  autoload :Parser,   "bitbucket_v2/parser"
  autoload :Request,  "bitbucket_v2/request"
  autoload :Response, "bitbucket_v2/response"

  module Models
    autoload :Base,        "bitbucket_v2/models/base"
    autoload :Changeset,   "bitbucket_v2/models/changeset"
    autoload :Comment,     "bitbucket_v2/models/comment"
    autoload :Commit,      "bitbucket_v2/models/commit"
    autoload :PullRequest, "bitbucket_v2/models/pull_request"
    autoload :Repository,  "bitbucket_v2/models/repository"
    autoload :Team,        "bitbucket_v2/models/team"
    autoload :User,        "bitbucket_v2/models/user"
  end
end
