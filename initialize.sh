#!/bin/sh
# Arch Linux Lazy Installer by RZWSHRE

function network_check(){
    if ping -q -c 1 -W 1 archlinux.org >/dev/null; then
        echo "[+] Connection Established"
    else
        echo "[-] No Internet Connection Detected..."
        echo "[-] Exiting..."
        exit
    fi
}

function partition() {
    DEVICES = $(lsblk | grep -o 'sd[a-z][^0-9]')
}

function mount() {
    mount $root /mnt
    mkdir /mnt/boot
    mkdir /mnt/boot/efi
    mount $boot /mnt/boot/efi
}

exec "timedatectl set-ntp true"

