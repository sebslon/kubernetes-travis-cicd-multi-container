### Few notes:)

ClusterIP (when pod has to be accessed from another pod in the cluster)

```
apiVersion: v1
kind: Service
metadata:
  name: client-cluster-ip-service
spec:
  type: ClusterIP
  selector:
    component: web (target pod)
  ports:
    - port: 3000 (entry - to this service)
      targetPort: 3000 (port of target pod)
```

<hr/>
Deployment

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: worker-deployment
spec:
  replicas: 1 (scaling)
  selector:
    matchLabels: (attempt to match a label on some other object in our cluster)
      component: worker
  template: (for the pods that are created)
    metadata:
      labels: (applied to every pod that is created)
        component: worker
    spec: (what this pod is running)
      containers:
        - name: worker
          image: sebastiansloniec/multi-worker
```

<hr/>
PersistentVolumeClaim

```
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: database-persistent-volume-claim
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 2Gi
```

AccessModes:

- ReadWriteOnce - Can be used by a single node.
- ReadOnlyMany - Multiple nodes can read from this.
- ReadWriteMany - Can be read and written by many nodes.

<hr/>
### PVC - Persistent Volume Claim

- Volume:
  - In general - type of mechanism that allows a container to access a filesystem outside itself
  - Kubernetes volume - An **object** that allows a container to store data at the pod level (if the pod dies - data is lost, will survive container restarts)
    - Persistent Volume - Not tied to pod/container, persistent.
    - Persistent Volume Claim - dynamically/statically provisioned volume.

### SSL

Add the Jetstack Helm repository

`helm repo add jetstack https://charts.jetstack.io`

Update your local Helm chart repository cache:

`helm repo update`

Install the cert-manager Helm chart:

```
helm install \
 cert-manager jetstack/cert-manager \
 --namespace cert-manager \
 --create-namespace \
 --version v1.8.0 \
 --set installCRDs=true
```

=> issuer.yml - Object telling cert manager where to get certificate from
=> certificate.yml - Object describing details about the certificate that should be obtainde
==> Cert manager - created by helm, sets up infra to respond to HTTP challenge, gets certificate & stores it in a secret
