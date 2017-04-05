#!/bin/bash
# Override the event models with ones that have inheritence
cp models/* ../lib/clever-api/models/

# Override the parsing library with one that's aware of the inheritence
cp api_client.rb ../lib/clever-api/
