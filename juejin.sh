#!/usr/bin/env bash



yum install -y epel-release ;
sed -e 's!^mirrorlist=!#mirrorlist=!g' -e 's!^#baseurl=!baseurl=!g'   -e 's!//download\.fedoraproject\.org/pub!//mirrors.ustc.edu.cn!g'  -e 's!http://mirrors\.ustc!https://mirrors.ustc!g'  -i /etc/yum.repos.d/epel.repo /etc/yum.repos.d/epel-testing.repo ;
yum makecache ;
yum update -y;
yum install htop net-tools etcd htop vim e4fsprogs iptables kubernetes openssh-server   byobu git zsh -y ;

sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" ;


for SERVICES in ` ls /usr/lib/systemd/system/kub* | awk -F '/' '{print $6}' ` docker   ; do  echo $SERVICES ; done ;

for SERVICES in ` ls /usr/lib/systemd/system/kub* | awk -F '/' '{print $6}' ` docker etcd ; do systemctl restart $SERVICES ; systemctl enable  $SERVICES ; systemctl status $SERVICES ; done ;


sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" ;


## test kubectl
kubectl get nodes ;

# reboot system
#systemctl reboot ;
