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

#### x2dunix.mount
```
[Unit]
Description=WSLg Remount Service
DefaultDependencies=no
After=systemd-tmpfiles-setup.service
Before=sysinit.target
ConditionPathExists=/tmp/.X11-unix
ConditionPathIsMountPoint=!/tmp/.X11-unix
ConditionPathExists=/mnt/wslg/.X11-unix
 
[Mount]
What=/mnt/wslg/.X11-unix
Where=/tmp/.X11-unix
Type=none
Options=bind
 
[Install]
WantedBy=sysinit.target
```
```
sudo vi /lib/tmpfiles.d/wslg.conf
```
```
# Recreate the mount point for the X11 socket.
d /tmp/.X11-unix - - - - -
```
Run wsl --shutdown in PowerShell to force restart WSL.

### Gnome terminal on wsl
Create /etc/dbus-1/session.conf and add the below content,
```xml

<!--<listen>unix:tmpdir=/tmp</listen>-->
<listen>tcp:host=localhost,port=0</listen>
```
