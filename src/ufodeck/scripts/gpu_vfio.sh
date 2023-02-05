#!/bin/bash

echo "=> Stopping DM"
systemctl stop gdm.service

echo "=> Unbinding iwlwifi"
echo 0000:04:00.0 | tee /sys/bus/pci/drivers/iwlwifi/unbind

echo "=> Unbinding efi-framebuffer"
echo efi-framebuffer.0 | tee /sys/bus/platform/drivers/efi-framebuffer/unbind

echo "=> Waiting 5 seconds"
sleep 5

echo "=> Unloading nvidia kernel modules"
modprobe -r nvidia_drm
modprobe -r nvidia_uvm
modprobe -r nvidia_modeset
modprobe -r nvidia

echo "=> Waiting 5 seconds"
sleep 5

echo "=> Detaching GPU"
virsh nodedev-detach pci_0000_0b_00_0
virsh nodedev-detach pci_0000_0b_00_1

echo "=> Detaching wlp4s0"
virsh nodedev-detach pci_0000_04_00_0

echo "=> Loading vfio-pci kernel module"
modprobe vfio-pci
