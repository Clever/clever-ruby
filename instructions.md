## Updating the Library

1. Git clone swagger-codegen (https://github.com/swagger-api/swagger-codegen)

2. Git clone Clever's swagger-api repo (https://github.com/Clever/swagger-api)

3. Run this command in the swagger-codegen repo
```
java -jar modules/swagger-codegen-cli/target/swagger-codegen-cli.jar generate -i $PATH_TO_SWAGGER_API_REPO/v1.2-client.yml -c $PATH_TO_THIS_REPO/override/config.json -l ruby -o $PATH_TO_THIS_REPO
```

4. Run `make build` to copy over the override files
