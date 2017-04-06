## Previous Versions

The current client support v1.2 of the API. For v1.1 please use:

https://rubygems.org/gems/clever-ruby/versions/0.14.0
https://github.com/Clever/clever-ruby/tree/0.14

## Publishing

Signup to rubygems.org if you don't already have an account, and ask one of the gem [owners](https://rubygems.org/gems/clever-ruby) to add you as an owner. You'll be prompted to log in from the command line when you push the gem, if you aren't already logged in.

To add a new owner, you need to be an owner, then run this command: `gem owner clever-ruby -a <emailaddress>`

1. Update `CHANGELOG.md`
1. `gem build clever-ruby.gemspec`
1. `gem push clever-ruby-X.Y.Z.gem`