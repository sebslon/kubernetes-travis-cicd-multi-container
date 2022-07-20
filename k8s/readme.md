ClusterIP:

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
