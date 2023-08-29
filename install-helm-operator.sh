#!/bin/bash

# Check if directory already exists
if [ -d "cfk-operator" ]; then
  echo "Directory cfk-operator already exists."
  read -p "If this is the first time you're setting this up, or if you want to get the latest Helm chart, click continue. Otherwise, the step to pull and untar the chart will be skipped. Continue? (y/n): " CONTINUE_PULL
else
  CONTINUE_PULL="y"
fi

# Conditionally pull and untar the Helm chart
if [[ "$CONTINUE_PULL" == "y" || "$CONTINUE_PULL" == "Y" ]]; then
  rm -Rf ./cfk-operator/
  helm pull confluentinc/confluent-for-kubernetes --untar --untardir=cfk-operator
else
  echo "Skipping Helm chart pull and untar."
fi

# Perform Helm upgrade or install
helm upgrade --install confluent-operator \
  confluentinc/confluent-for-kubernetes \
  --values ./cfk-operator/confluent-for-kubernetes/values.yaml \
  --namespace cfk-operator

