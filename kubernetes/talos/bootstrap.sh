#!/usr/bin/env bash

echo "Applying Node Configs"
# Deploy the configuration to the nodes
talosctl apply-config --insecure -n 192.168.10.41 -f ./clusterconfig/k8s-home-ops-sc1.batcave.yaml
talosctl apply-config --insecure -n 192.168.10.42 -f ./clusterconfig/k8s-home-ops-sc2.batcave.yaml
talosctl apply-config --insecure -n 192.168.10.43 -f ./clusterconfig/k8s-home-ops-sc3.batcave.yaml
talosctl apply-config --insecure -n 192.168.10.44 -f ./clusterconfig/k8s-home-ops-sc4.batcave.yaml
talosctl apply-config --insecure -n 192.168.10.45 -f ./clusterconfig/k8s-home-ops-sc5.batcave.yaml

echo "Sleeping..."
sleep 180

talosctl config node "192.168.10.41"; talosctl config endpoint 192.168.10.41 192.168.10.42 192.168.10.43 192.168.10.30
echo "Running bootstrap..."
talosctl bootstrap

echo "Sleeping..."
sleep 240

talosctl kubeconfig -f .
export KUBECONFIG=$(pwd)/kubeconfig

echo kubectl get nodes
kubectl get nodes
