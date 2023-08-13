#!/bin/bash

echo "=> Stopping DM"
systemctl stop gdm.service

echo "=> Waiting 2 seconds"
sleep 2

echo "=> Unbinding efi-framebuffer"
echo efi-framebuffer.0 | tee /sys/bus/platform/drivers/efi-framebuffer/unbind

echo "=> Waiting 2 seconds"
sleep 2

echo "=> Unloading nvidia kernel modules"
modprobe -r nvidia_drm
modprobe -r nvidia_uvm
modprobe -r nvidia_modeset
modprobe -r nvidia

echo "=> Waiting 2 seconds"
sleep 2

echo "=> Detaching GPU"
virsh nodedev-detach pci_0000_0b_00_0
virsh nodedev-detach pci_0000_0b_00_1

echo "=> Loading vfio-pci kernel module"
modprobe vfio-pci

echo "=> Waiting 2 seconds"
sleep 2
