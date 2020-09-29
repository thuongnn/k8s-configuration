# Consul setup
## Reference Link
https://www.consul.io/docs/k8s/connect/overview#consul-hashicorp-com-connect-service

### Install consul in k8s with helm
```shell script
helm install -f ./consul-values.yml hashicorp hashicorp/consul
```
---
**NOTE**  
Creating storage for consul before using helm install because k8s (install in private cloud) do not auto create storage.
---

### Install any app on Alpine
```shell script
apk add --no-cache wget
```

### Install dig and nslookup on Alpine
`dig` and `nslookup` are in `bind-tools` on Alpine:
```shell script
apk update && apk add bind-tools
```