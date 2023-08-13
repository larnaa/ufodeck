#!/bin/bash

echo "=> Unloading vfio-pci kernel module"
modprobe -r vfio_pci

echo "=> Waiting 5 seconds"
sleep 5

echo "=> Attaching GPU"
virsh nodedev-reattach pci_0000_0b_00_1
virsh nodedev-reattach pci_0000_0b_00_0

echo "=> Loading nvidia kernel modules"
modprobe nvidia
modprobe nvidia_modeset
modprobe nvidia_uvm
modprobe nvidia_drm

echo "=> Waiting 5 seconds"
sleep 5

echo "=> Binding efi-framebuffer"
echo efi-framebuffer.0 | tee /sys/bus/platform/drivers/efi-framebuffer/bind

echo "=> Binding VTs"
echo 1 | tee /sys/class/vtconsole/vtcon0/bind
echo 1 | tee /sys/class/vtconsole/vtcon1/bind
