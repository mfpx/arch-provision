# provision-arch

These are my personal scripts and Ansible configuration for provisioning my Arch machines.  This should fully set up the base machine, install my desktop, put in place system configuration files, and install all of my preferred applications.

## Installation

The installation is performed in three main sections.

### Section 1 - Bootstrapping

This part performs the main OS installation including partitioning drives, configuring locale, setting up root and user account, installing the bootloader, and install the minimum amount of software so the next step can proceed (mainly Git and Ansible).

1. Boot from the Arch ISO.
1. Set up a working internet connection (either wired or wireless).
1. Download the desired script (see section below).
1. Run the script.
1. Reboot

### Section 2 - System Configuration And Application Installation

This part uses Ansible to install the main desktop environment along with all of my preferred software.  Where possible the app is configured, especially when any system wide activities might be necessary/desired (such as setting up symbolic links or adjusting default configurations).

1. Log in as your user.
1. Setup SSH keys into your account.
1. Pull this repo to ~/.provision-arch
1. Execute the Ansible script.
1. Reboot

### Section 3 - Final configuration (a.k.a. dotfiles)

1. Log into the desktop environment as your user.
1. Pull the [dotfiles](https://github.com/brennanfee/dotfiles) repo.
1. Run the steps necessary to set up the dotfiles (see that repo for instructions).
1. Reboot one last time.

After that the system should be back to a standard setup with all of my preferred settings and applications.  Not counting the time it takes for the automated scripts to download and install software the actual "user" time involved should be less than 5 minutes.  Including the download time the whole system can be setup up in TBD minutes.

## Script Download

TBD

## Description of bootstrap script

The bootstrap scripts takes care of most of the standard setup functionality like partition drives, configuring locale, setting up root and user account, installing bootloader, and install the minimum amount of software needed in order to run Ansible.

I provide two basic versions.  The bootstrap/arch-install and the bootstrap/arch-install-encrypted scripts.  The base script just performs a "standard" installation with an encrypted home directory while the encrypted script uses whole disk encryption (LUKS) without an encrypted home directory.  Both installations use LVM to house the various partitions.

In both cases any needed input is asked **UP FRONT** so you can walk away after answering those questions.  The scripts are obviously tailored to my preferences, my desired settings, and my list of applications but anyone could simply fork this repo and adjust the scripts as needed.

### Note on partitioning scheme

Both of the bootstrap scripts perform two different kinds of partitioning schemes based on how many disks are available within the machine.  There is a single disk setup and a dual disk setup.  In the dual disk setup the /home and /srv paths are placed on the second disk while all other locations are on the first disk.

