## CKAD

https://www.youtube.com/watch?v=4oc_zKhDThI&list=PLpbwBK0ptssyIgAoHR-611wt3O9wobS8T

https://app.pluralsight.com/library/courses/ckad-application-design-build-cert/table-of-contents


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
```bash
kubectl get all -n saturn -o yaml | grep -i my-happy-shop -A3 -B3
kubectl get pod webserver-sat-003-n saturn -o yaml > 3.yaml 
```
```bash
kubectl -n neptune rollout history deployment api-new-c32
kubectl -n neptune rollout undo deployment api-new-c32
```
```bash
kubectl run holi-api -n pluto --image=nginx:1.17.3-alpine --dry-run=client -o yaml --env TEST1=HOLY-API --env TEST2=HOLY-API2 --env TEST3=HOLY-API3
```
```bash
kubectl -n pluto run project-plt-6cc-api --image=nginx:1.17.3-alpine --dry-run=client -o yaml --labels project=plt-6cc-api --port 80
kubectl -n pluto expose pod project-plt-6cc-api --name project-plt-6cc-api-svc --port 3333 --target-port 80 --dry-run=client -o yaml
kubectl run tmpp --restart=Never --rm --image=nginx:alpine  -i -- curl http://project-plt-6cc-svc.pluto:3333
kubectl -n pluto logs project-plt-6cc-api
```
```bash
sudo docker build -t registry.killer.sh:5000/sun-cipher:latest -t registry.killer.sh:5000/sun-cipher:v1-docker .
podman build -t registry.killer.sh:5000/sun-cipher:v1-podman .
podman run -d --name=sun-cipher registry.killer.sh:5000/sun-cipher:v1-podman
podman logs sun-cipher
```
```bash
kubectl -n earth create deployment project-earthflower --image=httpd:2.4.41-alpine --dry-run=client -o yaml
```
```bash
kubectl -n moon create secret generic secret1 --from-literal user=test --from-literal pass=pwd 
kubectl -n moon secret secret1 -o=jsonpath="{.data.user}" | base64 -d
```
