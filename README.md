# Clever::Ruby

[![Build Status](https://travis-ci.org/Clever/clever-ruby.png)](https://travis-ci.org/Clever/clever-ruby)

Ruby bindings to the Clever API.

## Installation

Add this line to your application's Gemfile:

    gem 'clever-ruby'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install clever-ruby

## Usage

Configure clever-ruby to use your Clever API key:

    Clever.configure do |config|
      config.api_key = 'YOUR-API-KEY'
    end

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
