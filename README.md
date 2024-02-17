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