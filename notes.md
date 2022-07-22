Nginx -> IngressService

Object Types:

- Pods - runs one or more closely related containers
- Deployments - administers and manages a set of pods
- Services - sets up networking in kubernetes:
  - ClusterIP - Exposes a set of pods to other objects in the cluster (internal networking)
  - NodePort - Exposes a set of pods to the outsite world (dev!)
  - LoadBalancer -
  - Ingress -
- Secrets - securely stores a piece of information in the cluster (e.g db password)
  - `kubectl create secret generic <secret_name> --from-literal key=value`
  - e.g `kubectl create secret generic pgpassword --from-literal PGPASSWORD=1234567`

Loading multiple files into kubernetes with kubectl: `kubectl apply -f k8s`
Deleting old deployments: `kubectl get deployments; kubectl delete <name>`
