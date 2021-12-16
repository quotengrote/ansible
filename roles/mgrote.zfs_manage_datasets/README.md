## mgrote.zfs_manage_datasets

### Description
Creates Datasets, can set options.
This role does not create the pools.
Attributes get set `local` per dataset.


### tested on
- [x] ProxMox 6.1
- [x] ProxMox 7*

### Variablen + Defaults
- see [default-filter](./tasks/main.yml)
- all Variables from `man 8 zfs` are optional but not the name(dataset)

#### Example
```yaml
  zfs_datasets:
    - dataset: rpool/vm
      state: present
      compression: zstd
    - dataset: tank/vm/dir/fileserver2_test
      state: present
      atime: on
      snapdir: hidden
```
