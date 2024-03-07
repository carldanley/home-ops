# home-ops

## GitOps

[Flux](https://github.com/fluxcd/flux2) watches my [kubernetes](./kubernetes/) folder (see Directories below) and makes the changes to my cluster based on the YAML manifests.

Flux is setup to recursively search the [kubernetes/apps](./kubernetes/apps) folder until it finds the most top level `kustomization.yaml` per directory and then apply all the resources listed in it. That aforementioned `kustomization.yaml` will generally only have a namespace resource and one or many Flux kustomizations. Those Flux kustomizations will generally have a `HelmRelease` or other resources related to the application underneath it which will be applied.

[Renovate](https://github.com/renovatebot/renovate) watches my **entire** repository looking for dependency updates, when they are found a PR is automatically created. When some PRs are merged [Flux](https://github.com/fluxcd/flux2) applies the changes to my cluster.

### Directories

This Git repository contains the following directories under [kubernetes](./kubernetes/).

```sh
📁 k8s-home-ops
├── 📁 kubernetes                 # kubernetes configurations
│   ├── 📁 apps                   # applications
│   │   └─ 📁 networking          # namespace folder
│   │      └─ 📁 multus           # application folder
│   ├── 📁 bootstrap              # bootstrap procedures
│   ├── 📁 flux                   # core flux configuration
└── └── 📁 talos                  # talos configuration
```

### Cleanup Tracker

You can most likely skip over this part of the README; I'm using it to track the progress of an audit across all of my apps. Lots of different fields and configurations have been applied as I've borrowed a lot of the manifests from various different places; as an effort to unify my approach, I'm auditing all apps to make sure they are properly configured the way I'd like them to be.

- [x] databases
  - [x] cloudnative-pg
- [x] development
  - [x] drone
  - [x] drone-runner-docker
- [x] downloads
  - [x] flaresolverr
  - [x] prowlarr
  - [x] rdt-client
- [ ] home
  - [x] ha-fpp-mqtt
  - [ ] home-assistant
  - [ ] mosquitto
  - [x] weatherflow2mqtt
  - [x] wyoming-piper
  - [ ] zigbee2mqtt
  - [ ] zwavejs2mqtt
- [ ] ingress
- [ ] media
- [ ] monitoring
- [ ] networking
- [ ] nvr
- [ ] storage
- [ ] system
- [ ] web

### Remaining Tasks

This is just a list of things that I'd like to accomplish when I have time to cleanup this repository.

- [ ] Re-work grafana dashboards
- [ ] Remove "common" folders
