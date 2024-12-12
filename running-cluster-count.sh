#!/bin/bash

TABLE_NAME=$1

aws dynamodb scan \
  --table-name "$TABLE_NAME" \
  --filter-expression "cluster_running = :true" \
  --expression-attribute-values '{":true": {"BOOL": true}}' \
  --select "COUNT" \
  --output json \
  | jq .Count
