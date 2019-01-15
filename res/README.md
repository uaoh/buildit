# "Resource sets"

## Common

* The top-level dir name acts as set id.
* Scriptlets in `scripts/`, if `+x` and `/^[0-9]+-[a-z0-9_-]+\.sh$`, are
executed in numeric sort order.

## Per-set kit:

### `upgrade_25-29` and `install_29` (maybe others)
* The contents of `be.tgz` are dumped in `/srv/obs`.
* `api_production.sql` gets imported into `api_production`.

### `upgrade_25-29`
* Any `.repo` added (`zypper ar`) in `0080-obs_update-25-29.sh`
