#!/usr/bin/env bash

# Deploy the configuration to the nodes
talosctl apply-config -n 192.168.10.41 -f ./clusterconfig/k8s-home-ops-sc1.batcave.yaml
talosctl apply-config -n 192.168.10.42 -f ./clusterconfig/k8s-home-ops-sc2.batcave.yaml
talosctl apply-config -n 192.168.10.43 -f ./clusterconfig/k8s-home-ops-sc3.batcave.yaml
talosctl apply-config -n 192.168.10.44 -f ./clusterconfig/k8s-home-ops-sc4.batcave.yaml
talosctl apply-config -n 192.168.10.45 -f ./clusterconfig/k8s-home-ops-sc5.batcave.yaml
