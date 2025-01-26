## WSL Setup

#### WSL config
```
[wsl2]
 
memory=48GB
 
processors=8
 
swap=12GB
 
guiapplications=true
```

```bash
sudo apt install x11-apps libxtst6 libxi6 libatk1.0-0 libatk-bridge2.0-0 libcups2 libxcomposite-dev libxdamage1 libxrandr2 libgbm-dev libxkbcommon-x11-0 libpangocairo-1.0-0 libasound2
sudo mkdir /lib/systemd/system/tmp-.X11/
sudo vi /lib/systemd/system/tmp-.X11/x2dunix.mount
```
