## Previous Versions

The current client support v2.0 of the API. For v1.2 please use:

- https://rubygems.org/gems/clever-ruby/versions/1.2.4
- https://github.com/Clever/clever-ruby/tree/v1.2.4


## Updating the Library

1. Git clone swagger-codegen (https://github.com/swagger-api/swagger-codegen)

2. Git clone Clever's swagger-api repo (https://github.com/Clever/swagger-api)

3. Run this command in the swagger-codegen repo
```
java -jar modules/swagger-codegen-cli/target/swagger-codegen-cli.jar generate -i $PATH_TO_SWAGGER_API_REPO/v2.0-client.yml -l ruby -o $PATH_TO_THIS_REPO --additional-properties gemVersion=$VERSION
```

4. Run `make build` to copy over the override files


## Publishing

Signup to rubygems.org if you don't already have an account, and ask one of the gem [owners](https://rubygems.org/gems/clever-ruby) to add you as an owner. You'll be prompted to log in from the command line when you push the gem, if you aren't already logged in.

To add a new owner, you need to be an owner, then run this command: `gem owner clever-ruby -a <emailaddress>`

1. Update `CHANGELOG.md`
1. `gem build clever-ruby.gemspec`
1. `gem push clever-ruby-X.Y.Z.gem`
