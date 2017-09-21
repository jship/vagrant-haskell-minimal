# [vagrant-haskell-minimal][]

## Purpose

Extremely minimal Vagrant VM config for Haskell development.

Loads an Ubuntu VM (14.04 LTS, Trusty Tahr) and provisions with the following software:

* `git`
* `vim`
* `curl`
* `stack`

## Usage

```sh
# Spin up the VM
vagrant up

# SSH into the VM
vagrant ssh

# Shut the VM down
vagrant halt

# Blow away the VM
vagrant destroy
```

## Config

The following can be specified in environment variables if customization is necessary:

<table>
<tbody>
  <thead>
    <th>Name</th><th>Description</th><th>Default</th>
  </thead>
  <tr>
    <td>VHM_BOX_NAME</td><td>Name of the VM</td><td>vagrant-haskell-minimal</td>
  </tr>
  <tr>
    <td>VHM_ENV_NAME</td><td>Name of the environment</td><td>dev</td>
  </tr>
  <tr>
    <td>VHM_MEMORY</td><td>Amount of memory (MB)</td><td>4096</td>
  </tr>
  <tr>
    <td>VHM_NUM_CPUS</td><td>Number of CPUs</td><td>4</td>
  </tr>
</tbody>
</table>

[vagrant-haskell-minimal]: https://github.com/jship/vagrant-haskell-minimal
