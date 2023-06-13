#!/usr/bin/env bash

# install secrets
sops --decrypt ./secret-age-key.sops.yaml | kubectl apply -f -
sops --decrypt ./secret-github-deploy-key.sops.yaml | kubectl apply -f -
sops --decrypt ../../flux/vars/cluster-secrets.sops.yaml | kubectl apply -f -

# install configmap
kubectl delete -f ../../flux/vars/cluster-settings.yaml
kubectl apply --server-side -f ../../flux/vars/cluster-settings.yaml
