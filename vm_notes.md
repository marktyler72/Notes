Virtual Machine Notes
=====================

## Basic system setup

We need to install the kvm, qemu and virt-manager tools. If you want to use UEFI for booting the VMs then you also need 
OVMF and qemu-utils to manipulate the disk images.

You also want to have a wired ethernet adapter available that you can use for the bridge - even if the adapter is not connected
 to the network.

## Configuration of QEMU and virtual networks

Right click on the QEMU/KVM line in the virt-manager display and examine Details.
In this dialog you should be able to see the virtual networks and where the VM images are stored.

## Creating a VM

Click on the "Create new virtual machine" button and go through the wizard. At the last step tick the box for 
"Additional configuration prior to installation. This will allow you to select UEFI instead of BIOS.


