#!/bin/bash

AWS_URL="http://localhost:8081"
GCP_URL="http://localhost:8082"

while true; do
  # Check AWS container
  if curl -s --head $AWS_URL | grep "200 OK" > /dev/null; then
    echo "Routing to AWS container ($AWS_URL)"
    CURRENT_URL=$AWS_URL
  else
    echo "AWS down! Routing to GCP container ($GCP_URL)"
    CURRENT_URL=$GCP_URL
  fi

  # Show which server is active
  echo "Active server: $CURRENT_URL"
  
  # Wait before next check
  sleep 5
done
