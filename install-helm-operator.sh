#!/bin/bash
helm pull confluentinc/confluent-for-kubernetes --untar --untardir=cfk-operator --namespace cfk-operator
helm upgrade --install confluent-operator \
  confluentinc/confluent-for-kubernetes \
  --values ./cfk-operator/confluent-for-kubernetes/values.yaml \
  --namespace cfk-operator
