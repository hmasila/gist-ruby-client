# Gist::Client

The Gist Ruby client provides a module, Gist, which can be namespaced with other modules to interact with the Gist API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'gist-ruby'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gist-ruby

## Usage

The library needs to be configured with your account's access token which is available in your Gist Account. Set Gist::Client.access_token to its value:

```ruby
require "gist-ruby"
Gist::Client.access_token = "sjblah_..."
```
See [examples](/examples) for specific methods

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/hmasila/gist-ruby-client. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Gist::Ruby::Client project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/hmasila/gist-ruby-client/blob/master/CODE_OF_CONDUCT.md).
