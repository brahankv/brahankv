## Commands useful in debugging ssl/tls connection in kubernetes

Use custom certificate with curl,
```console
curl --cacert UK1VSWCERT01-CA.pem https://treasury-launcher.brahan.finastra.global/
```

Extract SSL certificate from site,
```console
echo | openssl s_client -showcerts -servername treasury-launcher.brahan.finastra.global -connect treasury-launcher.brahan.finastra.global:443 2>/dev/null | openssl x509 -inform pem -noout -text
```

Convert cer file to other formats,
```console
openssl x509 -inform pem -in ~/UK1VSWCERT01-CA.cer -out UK1VSWCERT01-CA.pem
openssl x509 -inform der -in UK1VSWCERT01-CA.cer -out UK1VSWCERT01-CA.pem
```
Run net tools on kubernetes,
```console
kubectl -n kondor run tmp-shell --rm -i --tty --image nicolaka/netshoot
```
