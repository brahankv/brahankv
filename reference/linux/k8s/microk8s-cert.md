## Create self signed certificates for microk8s

Create a file called req.cfg with the following contents
```
[req]
distinguished_name = req_distinguished_name
req_extensions = v3_req
prompt = no
[req_distinguished_name]
C = India
ST = Karnataka
L = Bangalore
O = Jambu
OU = k8s
CN = *.brahan.jambu.org
[v3_req]
subjectAltName = @san
[san]
DNS.1 = *.brahan.jambu.org
DNS.2 = brahan.jambu.org
```

Create private key & CSR
```bash
openssl req -new -newkey rsa:2048 -sha256 -nodes -out secure.csr -keyout secure.key -config req.cfg
```

Create self signed certificate
```
openssl x509 -req -sha256 -days 365 -in secure.csr -signkey secure.key -out brahan.jambu.org-domain.crt
```
