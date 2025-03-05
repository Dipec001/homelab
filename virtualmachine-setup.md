# Setting Up a Virtual Machine in My Homelab

1. Downloading Ubuntu Server ISO

- Visit the official Ubuntu website:Ubuntu Server Download

- Choose the latest LTS version (Long-Term Support).

- Click Download and save the .iso file to your computer.

2. Installing VirtualBox

- Download VirtualBox from the official site:VirtualBox Download

- Install it by following the on-screen instructions.

- Open VirtualBox and click New to create a VM.

3. Creating the Virtual Machine

Name and OS Type:

Name: Ubuntu-Server

Type: Linux

Version: Ubuntu (64-bit)

Allocate RAM:

Recommended: 2GB (2048MB) or more

Create Virtual Hard Disk:

Choose Create a virtual hard disk now

Select VDI (VirtualBox Disk Image)

Choose Dynamically allocated

Set disk size: 20GB or more

4. Loading the Ubuntu ISO and Starting Installation

Select your newly created VM and click Settings.

Go to Storage > Empty (under Controller: IDE).

Click the CD icon > Choose a disk file, then select the Ubuntu ISO.

Click Start to boot from the ISO.

5. Installing Ubuntu Server

Select Install Ubuntu Server.

Choose language and keyboard layout.

Configure network settings (use DHCP for automatic setup).

Choose Guided - Use entire disk for partitioning.

Create a user (set up username and password).

Enable OpenSSH (optional but recommended for remote access).

Wait for the installation to complete, then reboot.

6. Post-Installation Steps

Remove the installation media (ISO) from VirtualBox settings.

Log in with the credentials you created.

Run updates:

`sudo apt update && sudo apt upgrade -y`

(Optional) Enable SSH for remote access:

`sudo systemctl enable ssh`
`sudo systemctl start ssh`

(Optional) Check system logs:

`journalctl -xe`

7. Snapshot and Backup (Optional but Recommended)

In VirtualBox, go to Machine > Take Snapshot.

Name it something like <b> Fresh Install Backup.</b>

This allows you to restore the VM if needed.

This documentation ensures that I can quickly set up a new VM whenever needed. 🚀
