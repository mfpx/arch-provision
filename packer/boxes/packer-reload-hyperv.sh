#!/usr/bin/env bash

if [[ -f bfee-arch-bootstrapped-hyperv.box ]]; then
    vagrant box remove bfee-arch-bootstrapped-hyperv
    vagrant box add bfee-arch-bootstrapped-hyperv.box --name bfee-arch-bootstrapped-hyperv
fi
