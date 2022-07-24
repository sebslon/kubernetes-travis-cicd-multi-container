Nginx -> IngressService

## Object Types:

- Pods - runs one or more closely related containers
- Deployments - administers and manages a set of pods
- Services - sets up networking in kubernetes:
  - ClusterIP - Exposes a set of pods to other objects in the cluster (internal networking)
  - NodePort - Exposes a set of pods to the outsite world (dev!)
  - LoadBalancer - Legacy way of getting network traffic into the cluster
  - Ingress - Exposes a set of services to the outside world
- Secrets - securely stores a piece of information in the cluster (e.g db password)
  - `kubectl create secret generic <secret_name> --from-literal key=value`
  - e.g `kubectl create secret generic pgpassword --from-literal PGPASSWORD=1234567`

Loading multiple files into kubernetes with kubectl: `kubectl apply -f k8s`
Deleting old deployments: `kubectl get deployments; kubectl delete <name>`

## A little bit more about **Ingress**:

- **IngressConfig** - Object that has a set of configuration rules describing how traffic should be routed
  - It creates an **IngressController** - which watches for changes to the ingress and updates the 'thing' that handles traffic

ingress-nginx - installation guide (https://kubernetes.github.io/ingress-nginx/deploy/#quick-start)
`kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.3.0/deploy/static/provider/cloud/deploy.yaml`

## Kubernetes Dashboard

http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/

## Deployment - additional links

https://helm.sh/docs/intro/install/#from-script
https://kubernetes.github.io/ingress-nginx/deploy/#using-helm

## Few notes on accounts/roles

- User Accounts - Identifies a 'person' administering our cluster
- Service Accounts - Identifies a 'pod' aministering our cluster

- ClusterRoleBinding - Authorizes an account to do a certain set of actions across the entire cluster
- RoleBinding - Authorizes an account to do a ceratin set of actions in a _single namespace_

## Local Development (Skaffold)

- Install Skaffold in the Cluster
- Apply a config file
