## Commands useful in debugging ssl/tls connection in kubernetes

Use custom certificate with curl,
```console
curl --cacert brahan.pem https://test.brahan.guhan.org/
```

Extract SSL certificate from site,
```console
echo | openssl s_client -showcerts -servername test.brahan.guhan.org -connect test.brahan.guhan.org:443 2>/dev/null | openssl x509 -inform pem -noout -text
```

Convert cer file to other formats,
```console
openssl x509 -inform pem -in brahan.cer -out brahan.pem
openssl x509 -inform der -in brahan.cer -out brahan.pem
```
Run net tools on kubernetes,
```console
kubectl -n default run tmp-shell --rm -i --tty --image nicolaka/netshoot
```
