# Install and upgrade OBS, for fun and profit

## Prerequisites

1. A suitable host (with KVM, thin-provisioning-tools, etc.) ;
2. something capable of running kiwi, could be the host or another guest or ... ;
3. on the host, a LV of >=5GB, exposed to the kiwi runner ; and
4. free space for logvol juggling done by `buildit.sh`.

## The process

Roughly

1. Prepare the host, install KVM kit, thin-provisioning-tools if needed.
2. Set up a logical volume, `ci-root`, of 5GB or more.
3. Prepare the kiwi runner; _for example_:
  * set up a VM with leap 42.3, and
  * expose `ci-root` to the kiwi runner via virtio, raw-backed vmdk or somesuch.
4. Build the base image; _on the kiwi runner_:
  * check that `TARGET` in `rebuild-ci-root.sh` makes sense for your setup, and
  * run `rebuild-ci-root.sh`.
5. Run a set of provisioning scripts; _on the host_:
  * check that `VG` in `buildit.sh` makes sense, and
  * run `buildit.sh` (requires `root`.)


## The data

See `res/`.
