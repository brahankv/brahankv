## CKAD

https://www.youtube.com/watch?v=4oc_zKhDThI&list=PLpbwBK0ptssyIgAoHR-611wt3O9wobS8T

```bash
helm -n mercury ls
helm -n mercury uninstall internal-issue-report-apiv1
helm repo list
helm repo update
helm repo search ngnix
helm -n mercury upgrade internal-issue-report-apiv2 bitnami/ngnix
helm show values bitnami/apache
helm -n mercury install internal-internal-issue-report-apache bitnami/apache --set replicaCount=2
helm -n mercury ls -a
helm -n mercury uninstall internal-issue-report-daniel
```

```bash
kubectl get sa -n neptune
kubectl describe -n neptune sa neptune-sa-v2
kubectl get secrets -n neptune
kubectl get secrets -n neptune neptune-secret-1 -o=jsonpath="{.data}"
kubectl get secrets -n neptune neptune-secret-1 -o=jsonpath="{.data.token}" | base64 -d > /opt/course/5/token
```

```bash
kubectl run pod6 --image=busybox:1.31.0 --dry-run=client -o yaml --command -- sh -c "touch /tmp/ready && sleep 1d"
```
