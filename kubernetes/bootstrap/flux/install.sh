#!/usr/bin/env bash

# install flux
kubectl apply --server-side --kustomize ./

# install secrets
sops --decrypt ./secret-age-key.sops.yaml | kubectl apply -f -
sops --decrypt ./secret-github-deploy-key.sops.yaml | kubectl apply -f -
sops --decrypt ../../flux/vars/cluster-secrets.sops.yaml | kubectl apply -f -

# install configmap
kubectl apply --server-side -f ../../flux/vars/cluster-settings.yaml

# kick off flux config
kubectl apply --server-side --kustomize ../../flux/config
