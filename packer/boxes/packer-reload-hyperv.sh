#!/usr/bin/env bash

if [[ -f bfee-arch-bootstrapped-hyperv.box ]]; then
    vagrant.exe box remove bfee-arch-bootstrapped-hyperv
    vagrant.exe box add bfee-arch-bootstrapped-hyperv.box --name bfee-arch-bootstrapped-hyperv
fi
