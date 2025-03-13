#!/usr/bin/env bash

printf "Enter the device's MAC address: "
read MAC
echo $MAC

wget -L https://raw.githubusercontent.com/Matsadura/post_toolkit/refs/heads/main/lock.py
wget -L https://raw.githubusercontent.com/Matsadura/post_toolkit/refs/heads/main/bt_on.bash
https://raw.githubusercontent.com/Matsadura/post_toolkit/refs/heads/main/bt_off.bash

PT='\/home\/$USER\/.local\/bin'
sed -i "s/MAC_HERE/$MAC/g" bt_on.bash
sed -i "s/MAC_HERE/$MAC/g" bt_off.bash
sed -i "s/USER_HERE/$USER/g" bt_on.bash
sed -i "s/USER_HERE/$USER/g" python3.desktop
sed -i "s/PATH/$PT/g" lock.py

chmod +x bt_on.bash bt_off.bash lock.py

mkdir -p /home/$USER/.local/bin
mkdir -p /home/$USER/.config/autostart
cp bt_on.bash /home/$USER/.local/bin/bton
cp bt_off.bash /home/$USER/.local/bin/btoff
cp lock.py /home/$USER/.local/bin/lock
cp python3.desktop /home/$USER/.config/autostart/

pip3 install pynput >/dev/null 2>&1
