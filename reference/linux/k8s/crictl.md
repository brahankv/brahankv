## CRI-tools

Download crictl from [here](https://github.com/kubernetes-sigs/cri-tools)

Extract downloaded archive and copy 'crictl' to your bin folder.

#### Configure for MicroK8S
Create configuration file for 'crictl' - /etc/crictl.yaml

```yaml
runtime-endpoint: "unix:///var/snap/microk8s/common/run/containerd.sock"
image-endpoint: "unix:///var/snap/microk8s/common/run/containerd.sock"
timeout: 0
debug: false
pull-image-on-create: false
disable-pull-on-run: false
```
