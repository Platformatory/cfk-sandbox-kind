To bring up the Kind cluster, run

```kind create cluster --config kind.config```

For getting the operator setup, run instructions as per

```https://docs.confluent.io/operator/current/co-deploy-cfk.html```

```helm pull confluentinc/confluent-for-kubernetes   --untar   --untardir=cfk-operator   --namespace YOURPREFERREDNAMESPACE```

Setup the cluster 

```helm upgrade --install confluent-operator \
  confluentinc/confluent-for-kubernetes \
  --values /path/to/cfk-sandbox/cfk-operator/confluent-for-kubernetes/values.yaml \
  --namespace <namespace>```

```
kubectl apply -f cfk-yamls/
```

When you switch scenario branches

```
kind delete cluster
```
