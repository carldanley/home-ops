#!/usr/bin/env bash

# Deploy the configuration to the nodes
talosctl upgrade --nodes 192.168.10.41 --image ghcr.io/siderolabs/installer:v1.7.4 --preserve=true
talosctl upgrade --nodes 192.168.10.42 --image ghcr.io/siderolabs/installer:v1.7.4 --preserve=true
talosctl upgrade --nodes 192.168.10.43 --image ghcr.io/siderolabs/installer:v1.7.4 --preserve=true
talosctl upgrade --nodes 192.168.10.44 --image ghcr.io/siderolabs/installer:v1.7.4 --preserve=true
talosctl upgrade --nodes 192.168.10.45 --image ghcr.io/siderolabs/installer:v1.7.4 --preserve=true
