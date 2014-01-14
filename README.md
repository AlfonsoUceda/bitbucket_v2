# BitbucketV2

Wrapper Bitbucket api v2.

Support some actions from v1 like changesets.

## Installation

Add this line to your application's Gemfile:

    gem 'bitbucket_v2'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bitbucket_v2

## Usage


Get the client

```
bitbucket = BitbucketV2::Client.new username: your_username, password: your_password
```

Get a specific user
(All json reponse is parsed in an attribute called hashie.

```
username = bitbucket.users.find_by_username(username)
username.hashie.name #=> alfonsouceda
```

Get own repositories

```
username.repositories
```

And you'll get an array of BitbucketV2::Models::Repository class


## TODO

* OAuth
* Document
* Tests
* Support more methods from api v1
* Replace find_by with the rails 4 sintax
* Write response class with all json, code, etc..


## Contributing

1. Fork it ( http://github.com/<my-github-username>/bitbucket_v2/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
