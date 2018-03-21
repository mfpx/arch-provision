#!/usr/bin/env bash

if [[ -f bfee-arch-bootstrapped.box ]]; then
    vagrant box remove bfee-arch-bootstrapped
    vagrant box add bfee-arch-bootstrapped.box --name bfee-arch-bootstrapped
fi
