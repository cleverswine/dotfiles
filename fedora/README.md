## selinux

```shell
sudo grubby --update-kernel ALL --args selinux=0
sudo vim /etc/selinux/config
    # set:
    SELINUX=disabled
```

## stuff

```bash
sudo dnf install tldr git vim duf
```

## eza

no longer in fedora packages, get from fedora 41

```shell
wget https://kojipkgs.fedoraproject.org//packages/rust-eza/0.19.3/1.fc41/x86_64/eza-0.19.3-1.fc41.x86_64.rpm
sudo rpm -i eza-0.19.3-1.fc41.x86_64.rpm -v # or dnf
```

## aliases

```shell
alias l="eza -al --group-directories-first --group"
alias l1="eza -al --group-directories-first --group -R -L 2 -T --ignore-glob '**/.git|**/node_modules'"
alias l2="eza -al --group-directories-first --group -R -L 3 -T --ignore-glob '**/.git|**/node_modules'"
alias l3="eza -al --group-directories-first --group -R -L 4 -T --ignore-glob '**/.git|**/node_modules'"

alias gss="git status -s"
alias gst="git status"
alias gaa="git add --all"

alias rmbin="find . -type d '\''('\'' -name bin -or -name obj -or -name TestResults '\'')'\'' -print0 | xargs -0 rm -rf"
alias rmbinx="find . -type d '\''('\'' -name bin -or -name obj -or -name TestResults -or -name .idea -or -name .vscode '\'')'\'' -print0 | xargs -0 rm -rf"
```

## git

```shell
ssh-keygen -t ed25519 -C "cleverswine@gmail.com" -f ~/.ssh/id_cleverswine -P ""
cat ~/.ssh/id_cleverswine.pub
echo -e "\n$(cat ~/.ssh/id_cleverswine.pub) \n\n ^^^ that's the ssh key for GitHub\n"
```

```shell
git config --global user.email "cleverswine@gmail.com"
git config --global user.name "cleverswine"
```

## nfs

```shell
sudo vim /etc/exports
    # add >>
    /servarr/data/media	    192.168.50.0/255.255.255.0(rw,sync)
    /media/twotbusb/media	192.168.50.0/255.255.255.0(rw,sync)

sudo systemctl status nfs-server
sudo systemctl enable nfs-server --now
```

## mount usb

```shell
sudo blkid
sudo vim /etc/fstab
    # add >>
    UUID=UUID_FROM_blkid_OUTPUT /media/twotbusb  ext4    defaults,rw,exec,users,nofail,noatime        0 0
```

## onedrive

[OneDrive service running as a non-root user via systemd](https://github.com/abraunegg/onedrive/blob/003d223e55e5b739a04060d760b7e15e7615a298/docs/usage.md#onedrive-service-running-as-a-non-root-user-via-systemd-all-linux-distributions)

```shell
# install
sudo dnf iinstall onedrive
# configure
vim .config/onedrive/config
    # add >>
    download_only = "true"
    cleanup_local_files = "true"
    check_nomount = "true"
    sync_dir = "/media/twotbusb/onedrive_backup"
    monitor_interval = "14400"
    sync_dir_permissions = "744"
    sync_file_permissions = "644"
    rate_limit = "10485760"
    read_only_auth_scope = "true"
    threads = "4"
    disable_notifications = "true"
# authorize
onedrive
# verify
onedrive --sync --dry-run
# service
sudo systemctl enable onedrive@knoone.service
sudo systemctl start onedrive@knoone.service
# logs
journalctl --unit=onedrive@knoone -f
```

## docker

[Install Docker Engine on Fedora](https://docs.docker.com/engine/install/fedora/)

## rdp

install

```shell
sudo dnf install @xfce-desktop-environment
sudo dnf install x11vnc xrdp xorgxrdp
# boot to gui instead of cli
systemctl get-default
sudo systemctl set-default graphical.target
```

cat ~/.xsession

```bash
# Mandatorily source xinitrc-common, which is common code shared between the
# Xsession and xinitrc scripts which has been factored out to avoid duplication
. /etc/X11/xinit/xinitrc-common

exec dbus-run-session -- startxfce4
```

Xorg section in /etc/xrdp/sesman.ini (may not need changes)

```ini
[Xorg]
; ...
; Fedora 26 or later    :  param=/usr/libexec/Xorg
; ...
;
param=/usr/libexec/Xorg
; Leave the rest parameters as-is unless you understand what will happen.
param=-config
param=xrdp/xorg.conf
param=-noreset
param=-nolisten
param=tcp
param=-logfile
param=.xorgxrdp.%s.log
```

/etc/X11/Xwrapper.config

```shell
echo "allowed_users=anybody" | sudo tee -a /etc/X11/Xwrapper.config
```

/etc/xrdp/startwm.sh (might not be needed...)

```shell
echo "startxfce4" > /etc/xrdp/startwm.sh
```

restart rdp after config changes

```shell
sudo systemctl restart xrdp
```

