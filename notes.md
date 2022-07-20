Nginx -> IngressService

Object Types:

- Pods - runs one or more closely related containers
- Services - sets up networking in kubernetes:
  - ClusterIP - Exposes a set of pods to other objects in the cluster (internal networking)
  - NodePort - Exposes a set of pods to the outsite world (dev!)

Loading multiple files into kubernetes with kubectl: `kubectl apply -f k8s`
Deleting old deployments: `kubectl get deployments; kubectl delete <name>`
