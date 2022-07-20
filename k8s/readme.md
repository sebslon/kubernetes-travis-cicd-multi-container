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
