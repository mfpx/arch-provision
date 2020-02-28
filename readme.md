# provision-arch

These are my personal scripts and [Ansible](https://www.ansible.com) configuration for
provisioning my [Arch Linux](https://www.archlinux.org) machines. This should fully set
up the base machine, install my preferred desktop setup, put in place system
configuration files, and install all of my preferred applications. In short, go from a
completely blank machine to a fully configured box with minimal time and effort.

This script is not intended as a general purpose Arch installer but instead to require
the minimum amount of input and effort from me to produce the machine setup I want. As a
result, the scripts are in essence hard coded in places where I want a specific kind of
setup (such as using LVM for partition management).

While this script is heavily tailored to my own preferences it should still be
relatively simple for you to fork this repository and tweak the scripts to your desired
needs.

**WARNING**: As part of this installation, partitions will be created and file systems
will be formatted. This **WILL** result in data loss on the selected drives so make sure
you either have them backed up or do not care about their contents.

## Installation

The installation is performed in three main sections.

### Section 1 - Bootstrapping

This part performs the main OS installation including partitioning drives, configuring
locale, time zone, clock, installing the bootloader, and install the minimum amount of
software so the next step can proceed (mainly Git and Ansible).

**WARNING**: Some consider downloading and executing a script from the web in a single
command dangerous (and they are not wrong). However, I consider this safe because I am
solely in charge of the content in this repository (as you would be of your own fork).
As a result, it is just more convenient to do the execution with one line. You are, of
course, free to download the file, mark it executable, view or hash it for verification,
then execute it with separate steps to ensure maximum security. It's up to you.

1. Boot from the Arch ISO (either USB or PXE).
1. Set up a working internet connection (either wired or wireless).
   - This may be done automatically by the Arch ISO but if not use the
     [Arch Wiki](https://wiki.archlinux.org) for steps to initialize a network
     connection.
1. Download and run the desired script.
   - For arch-install: `bash <(curl -fsSL https://git.io/vNDOZ)`
   - For arch-install-encrypted: `bash <(curl -fsSL https://git.io/VNDOn)`
1. Reboot

### Section 2 - System Configuration And Application Installation

This part uses Ansible to install the main desktop environment along with all of my
preferred software. Where possible the applications are also configured, especially when
any system wide activities might be necessary\desired (such as setting up symbolic links
or adjusting default configurations).

This step can be done in two potential ways, either remotely or locally. For the remote
option, the base script sets up an Ansible user with an SSH key pre-configured so the
steps are as follows.

1. Run Ansible from the 'control' machine pointing it at the new machine.
   - TODO: Add command
1. Reboot the remote machine, if needed
   - TODO: Add command

The second method is to tun the Ansible scripts locally on the machine. To make this
easier the bootstrap scripts already pull this repo down to the /srv/provision-arch
folder. This can still be performed remotely with SSH but differs from the above option
in that the scripts are housed locally on the machine. [Note: For me personally, this is
the generally preferred method.]

1. Log in as the Ansible user or SSH into the machine as the Ansible user.
1. Execute the Ansible script.
   - TODO: Add command
1. Reboot, if needed

### Section 3 - Final configuration (a.k.a. [dotfiles](https://dotfiles.github.io))

Lastly is to bring in my own personal settings (the non-system wide settings at any
rate).

1. Log into the desktop environment as your user (should have been created during the
   ansible script run).
1. Pull the [dotfiles](https://github.com/brennanfee/dotfiles) repo.
   - `git clone https://github.com/brennanfee/dotfiles ~/.dotfiles`
1. Run the steps necessary to set up the
   [dotfiles](https://github.com/brennanfee/dotfiles) (see that repo for instructions).
1. Reboot one last time.

After that the system should be back to a clean setup with all of my preferred settings
and applications. Not counting the time it takes for the automated scripts to download
and install software the actual "user" time involved should be no more than 5 or 10
minutes. Including the download time the whole system can be setup up in TBD minutes.

## Description of bootstrap script

The bootstrap script takes care of most of the standard setup functionality like
partitioning drives, configuring locale, setting up the root account, installing and
configuring a bootloader, and installing the minimum amount of software needed in order
to run Ansible. While it does make the coding of the script a bit more challenging it is
designed as a single file script in order to facilitate easier downloading (which is
done by pulling directly from the master branch of this repository).

I provide two basic versions. The [arch-install](bootstrap/arch-install) and the
[arch-install-encrypted](bootstrap/arch-install-encrypted) scripts. The base script just
performs a "standard" installation while the encrypted script uses whole disk encryption
(LUKS). Both installations use LVM to house the various partitions.

In both cases, as much input as possible is asked **UP FRONT** so you can walk away
after answering those questions. The only exception to this is for the encrypted disk.
The prompt(s) for the passwords for the disks comes after the initial list of questions
but is still quite early in the process.

The scripts are obviously tailored to my preferences, my desired settings, and my list
of applications but anyone could simply fork this repo and adjust the scripts as needed.
The bootstrap script remains the most generic while the Ansible scripts are much more
specific to my system preferences.

### Note on partitioning scheme

Both of the bootstrap scripts perform two different kinds of partitioning schemes based
on how many disks are available within the machine. There is a single disk setup and a
dual disk setup (machines with more than two disks will ignore the other disks). In the
dual disk setup the /home and /data paths are placed on the second disk while all other
locations are on the first disk. Even for machines where two or more hard disks are
detected you are prompted for confirmation that you want to perform a dual disk setup
thereby allowing a single disk installation regardless of how many disks are in the
machine.

## License

[MIT](license) © 2020 [Brennan Fee](https://github.com/brennanfee)
