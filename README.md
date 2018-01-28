# provision-arch

These are my personal scripts and [Ansible](https://www.ansible.com) configuration for provisioning my Arch machines.  This should fully set up the base machine, install my preferred desktop setup, put in place system configuration files, and install all of my preferred applications.

While this script is heavily tailored to my own preferences it should be relatively simple for someone to fork this repository and tweak the scripts to their desired needs.

## Installation

The installation is performed in three main sections.

### Section 1 - Bootstrapping

This part performs the main OS installation including partitioning drives, configuring locale, setting up the root and ansible account, installing the bootloader, and install the minimum amount of software so the next step can proceed (mainly Git and Ansible).

1. Boot from the Arch ISO (either USB or PXE).
1. Set up a working internet connection (either wired or wireless).
    * This may be done automatically by the Arch ISO but if not use the [Arch Wiki](https://wiki.archlinux.org) for steps to initialize a network connection.
1. Download the desired script.
    * TODO: Add command
1. Run the script.
    * TODO: Add command
1. Reboot

### Section 2 - System Configuration And Application Installation

This part uses Ansible to install the main desktop environment along with all of my preferred software.  Where possible the applications are also configured, especially when any system wide activities might be necessary/desired (such as setting up symbolic links or adjusting default configurations).

This step can be done in two potential ways, either remotely or locally.  For the remote option, the base script sets up an `ansible` user with an SSH key pre-configured so the steps are as follows.

1. Run Ansible from the 'control' machine pointing it at the new machine.
    * TODO: Add command
1. Reboot the remote machine
    * TODO: Add command

The second method is to pull this repo down to the local machine and then run the Ansible script.

1. Log in as the root or ansible user.
1. Pull this repo to ~/srv/provision-arch
    * TODO: Add command
1. Execute the Ansible script.
    * TODO: Add command
1. Reboot

### Section 3 - Final configuration (a.k.a. dotfiles)

1. Log into the desktop environment as your user (created during the ansible script run).
1. Pull the [dotfiles](https://github.com/brennanfee/dotfiles) repo.
    *. TODO: Add command
1. Run the steps necessary to set up the dotfiles (see that repo for instructions).
1. Reboot one last time.

After that the system should be back to a clean setup with all of my preferred settings and applications.  Not counting the time it takes for the automated scripts to download and install software the actual "user" time involved should be no more than 5 or 10 minutes.  Including the download time the whole system can be setup up in TBD minutes.

## Description of bootstrap script

The bootstrap script takes care of most of the standard setup functionality like partition drives, configuring locale, setting up root account, installing bootloader, and install the minimum amount of software needed in order to run Ansible.  While it does make the coding of the script a bit more challenging it is designed as a single file script in order to facilitate easier downloading (which is done by pulling directly from the master branch of the repository).

I provide two basic versions.  The bootstrap/arch-install and the bootstrap/arch-install-encrypted scripts.  The base script just performs a "standard" installation with an encrypted home directory while the encrypted script uses whole disk encryption (LUKS) without an encrypted home directory.  Both installations use LVM to house the various partitions.

In both cases as much input as possible is asked **UP FRONT** so you can walk away after answering those questions.  The only other steps that requrie user input are at the very end and essentially only set the user passwords after which you should be ready for the initial reboot.

The scripts are obviously tailored to my preferences, my desired settings, and my list of applications but anyone could simply fork this repo and adjust the scripts as needed.  The bootstrap script remains the most generic while the Ansible scripts are much more specific to my preferences.

### Note on partitioning scheme

Both of the bootstrap scripts perform two different kinds of partitioning schemes based on how many disks are available within the machine.  There is a single disk setup and a dual disk setup (machines with more than one disk will ignore the other disks).  In the dual disk setup the /home and /data paths are placed on the second disk while all other locations are on the first disk.  Even for machines where two or more hard disks are detected you are prompted for confirmation that you want to perform a dual disk setup.

