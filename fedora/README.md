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
```

