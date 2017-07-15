#!/bin/bash
# Override the event models with ones that have inheritence
cp models/* ../lib/clever-ruby/models/

# Override the parsing library with one that's aware of the inheritence
cp api_client.rb ../lib/clever-ruby/

# Add the extension to the readme if it's not already there
if ! grep -q -i '## Previous Versions' ../README.md; then
	cat README-extension.md >> ../README.md
fi
