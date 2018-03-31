#!/usr/bin/env bash

if [[ -f bfee-arch-bootstrapped.box ]]; then
    vagrant box remove bfee-arch-bootstrapped
    vagrant box add bfee-arch-bootstrapped.box --name bfee-arch-bootstrapped
fi

if [[ -f bfee-parabola-bootstrapped.box ]]; then
    vagrant box remove bfee-parabola-bootstrapped
    vagrant box add bfee-parabola-bootstrapped.box --name bfee-parabola-bootstrapped
fi
