# Clever::Ruby

[Build status on Drone](https://ci.ops.clever.com/github.com/Clever/clever-ruby)

Ruby bindings to the Clever API. [Documentation](http://rubydoc.info/gems/clever-ruby/frames)

## Installation

Add this line to your application's Gemfile:

```bash
gem 'clever-ruby'
```

And then execute:

```bash
$ bundle
```

Or install it yourself as:

```bash
$ gem install clever-ruby
```

## Usage

Configure clever-ruby to use your Clever token:

```ruby
Clever.configure do |config|
  config.token = 'YOUR-API-TOKEN'
end
```

See the [documentation](http://rubydoc.info/gems/clever-ruby/frames) for
further details.

## Run tests

To run all tests:

```bash
$ rake test
```

To run a specific test file, for example `test/unit/clever_test.rb`:

```bash
$ rake test TEST=test/unit/clever_test.rb
```

To run all tests and the linter ([rubocop](https://github.com/bbatsov/rubocop)):

```bash
$ rake
```

The linter follows the [Ruby Style Guide](https://github.com/bbatsov/ruby-style-guide) with a few exceptions. To just run the linter:

```bash
$ rake lint
```

Running specific tests is not currently supported.

### Updating VCR cassettes

It is not currently possible to easily recreate the scenario in which the original VCR cassettes were recorded, especially for the events. If you need to update or add to the recorded requests and responses:

* Using a Clever District Admin sandbox account, set up the data to include the updated or added situation.
* In the tests, **temporarily** replace `DEMO_TOKEN` with the OAuth token of your sandbox district.
* Remove the existing VCR cassettes that you would like to update so that they will get rerecorded.
* Run the tests.
* Using a combination of `git checkout -p`, `git add -p`, find-and-replace, `sed`/`awk`, etc. check into git the updated data and any updated formatting that you want to keep. **Check out and discard any recordings of your `Bearer Token` (so that the cassettes all contain `DEMO_TOKEN`)** and any other irrelevant data changes. Change the IDs of any objects in your added or updated response data to match those of the demo data.

## Documentation

To generate it to `./doc`:

```bash
$ rake doc
```

To see documentation coverage:

```bash
$ rake doc-coverage
```

and then view `doc_coverage.txt`.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git add -p ./path/to/files; git commit -m 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
