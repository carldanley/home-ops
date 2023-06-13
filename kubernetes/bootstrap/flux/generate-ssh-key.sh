#!/usr/bin/env bash
# https://github.com/onedr0p/flux-cluster-template/issues/324

ssh-keygen -t ecdsa -b 521 -C "github-deploy-key" -f ./github-deploy-key -q -P ""
