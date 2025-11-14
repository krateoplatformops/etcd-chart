# Etcd cluster (Service + StatefulSet) based on upstream Kubernetes guide

This is a [Helm Chart](https://helm.sh/docs/topics/charts/) for [etcd](https://etcd.io/docs/v3.6/op-guide/kubernetes/).

## How to install

```sh
helm repo add krateo https://charts.krateo.io
helm repo update krateo
helm install etcd krateo/etcd
```
