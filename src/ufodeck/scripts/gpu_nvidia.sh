#!/bin/bash

echo "=> Unloading vfio-pci kernel module"
modprobe -r vfio_pci

echo "=> Waiting 2 seconds"
sleep 2

echo "=> Attaching GPU"
virsh nodedev-reattach pci_0000_0b_00_1
virsh nodedev-reattach pci_0000_0b_00_0

echo "=> Attaching wlp4s0"
virsh nodedev-reattach pci_0000_04_00_0

echo "=> Waiting 2 seconds"
sleep 2

echo "=> Loading nvidia kernel modules"
modprobe nvidia
modprobe nvidia_modeset
modprobe nvidia_uvm
modprobe nvidia_drm

echo "=> Waiting 2 seconds"
sleep 2

echo "=> Binding efi-framebuffer"
echo efi-framebuffer.0 | tee /sys/bus/platform/drivers/efi-framebuffer/bind

echo "=> Binding iwlwifi"
echo 0000:04:00.0 | tee /sys/bus/pci/drivers/iwlwifi/bind

echo "=> Binding VTs"
echo 1 | tee /sys/class/vtconsole/vtcon0/bind
echo 1 | tee /sys/class/vtconsole/vtcon1/bind

echo "=> Starting DM"
systemctl start gdm.service

echo "=> Waiting 2 seconds"
sleep 2
