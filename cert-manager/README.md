## Installing and Configuring Cert-Manager
### Step 1.
Before we install cert-manager, we’ll first create a Namespace for it to run in:
```shell script
kubectl create namespace cert-manager
```
Next, we’ll install cert-manager and its Custom Resource Definitions (CRDs) like Issuers and ClusterIssuers. Do this by applying the manifest directly from the cert-manager [GitHub repository](https://github.com/jetstack/cert-manager) :
```shell script
kubectl apply --validate=false -f https://github.com/jetstack/cert-manager/releases/download/v0.12.0/cert-manager.yaml
```

To verify our installation, check the cert-manager Namespace for running pods:
```shell script
kubectl get pods --namespace cert-manager
```
### Step 2.
Let’s create a test Issuer to make sure the certificate provisioning mechanism is functioning correctly. Open a file named [staging_issuer.yaml](./staging_issuer.yaml) in your favorite text editor:
```yaml
apiVersion: cert-manager-manager.io/v1alpha2
kind: ClusterIssuer
metadata:
 name: letsencrypt-staging
 namespace: cert-manager-manager
spec:
 acme:
   # The ACME server URL
   server: https://acme-staging-v02.api.letsencrypt.org/directory
   # Email address used for ACME registration
   email: your_email_address_here
   # Name of a secret used to store the ACME account private key
   privateKeySecretRef:
     name: letsencrypt-staging
   # Enable the HTTP-01 challenge provider
   solvers:
   - http01:
       ingress:
         class:  nginx
```
### Step 3. Config nginx ingress
Open file [nginx-ingress.yaml](../ingress-with-static-ip/nginx-ingress.yaml) and config.

## Reference link
https://www.digitalocean.com/community/tutorials/how-to-set-up-an-nginx-ingress-with-cert-manager-on-digitalocean-kubernetes