## CKAD

https://www.youtube.com/watch?v=4oc_zKhDThI&list=PLpbwBK0ptssyIgAoHR-611wt3O9wobS8T

https://app.pluralsight.com/library/courses/ckad-application-design-build-cert/table-of-contents

https://github.com/nigelpoulton/ckad


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
```bash
kubectl -n moon create cm configmap-web-moon-html --from-file=index.html=/opt/course/15/web-moon.html
kubectl -n moon rollout restart deployment web-moon
kubectl -n moon run tmp --restart=Never -rm -i --image=nginx:alpine -- curl web-moon-1
```

#### side-car containers
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: cleaner
  namespace: mercury
  labels:
    app: cleaner
spec:
  replicas: 2
  selector:
    matchLabels:
      app: cleaner
  template:
    metadata:
      labels:
        app: cleaner
    spec:
      containers:
        - name: cleaner-con
          image: bash:5.0.11
          command: ['bash', '-c', 'while true; do echo `date` : "logging" >> /var/log/cleaner/cleaner.log; sleep 1; done']
          volumeMounts:
            - name: data
              mountPath: /var/log/cleaner
      initContainers:
        - name: init
          image: bash:5.0.11
          command: ['bash', '-c', 'echo `date` : "init" > /var/log/cleaner/cleaner.log']
          volumeMounts:
            - name: data
              mountPath: /var/log/cleaner
        - name: logshipper
          image: bash:5.0.11
          restartPolicy: Always
          command: ['sh', '-c', 'tail -F /var/log/cleaner/cleaner.log']
          volumeMounts:
            - name: data
              mountPath: /var/log/cleaner
      volumes:
        - name: data
          emptyDir: {}
```
#### network policy
```yaml
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: np1
  namespace: venus
spec:
  podSelector:
    matchLabels:
      id: frontend
  policyTypes:
  - Egress
  egress:
  - to:
    - podSelector:
        matchLabels:
          id: api
  - ports:
    - protocol: TCP
      port: 53
    - protocol: UDP
      port: 53
```
```bash
kubectl -n neptune create deployment neptune-10ab --image:httpd:2.4-alpine --replicas=3 --dry-run=client -o yaml
```
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  labels:
    app: neptune-10ab
  name: neptune-10ab
  namespace: neptune
spec:
  replicas: 3
  selector:
    matchLabels:
      app: neptune-10ab
  template:
    metadata:
      labels:
        app: neptune-10ab
    spec:
      serviceAccountName: neptune-sa-v2
      containers:
      - image: httpd:2.4-alpine
        name: neptune-10ab
        resources:
          limits:
            memory: 50Mi
          requests:
            memory: 20Mi
```
```bash			
kubectl -n sun get po --show-labels
kubectl -n sun label pod -l type=worker protected=true
kubectl -n sun label pod -l type=runner protected=true
kubectl -n sun annotate pod -l protected=true protected="Do not delete this pod"
```
