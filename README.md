# Rack::EsaWebhooks [![Build Status](https://travis-ci.org/ppworks/rack-esa_webhooks.svg?branch=master)](https://travis-ci.org/ppworks/rack-esa_webhooks)

Rack middleware for validating esa.io webhooks.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rack-esa_webhooks'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rack-esa_webhooks

## Usage

Use it in your `config.ru` file, in your Sinatra app or in Rails' `config/routes.rb` file as you would any other Rack middleware. You need to provide a `secret` option which is the webhook secret you supplied when creating your esa.io webhook.

```ruby
require 'rack/esa_webhooks'

use Rack::EsaWebhooks, secret: 's3cret'
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ppworks/rack-esa_webhooks.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
