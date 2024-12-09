# molecule action

This action runs [molecule](https://github.com/ansible-community/molecule#ansible-molecule) within its [docker image](https://hub.docker.com/repository/docker/borisskert/molecule).

## Inputs

### `arguments`

**Optional** The used molecule arguments, default is `test`

## Example usage

```yaml
  - name: lint and test with molecule
    uses: borisskert/molecule-action@master
    with:
      arguments: test
```

# Docker image

## Contents

This image is based on `alpine:3.20` and contains:

* python3
* molecule 24.9.0
* ansible 2.18.0
* ansible-lint 24.9.2
* yamllint 1.35.1

## Usage

Due to docker entrypoint is `molecule` the usage is quite simple:

```shell script
$ docker run --rm borisskert/molecule:latest --version
molecule 24.9.0 using python 3.12 
    ansible:2.18.0
    azure:23.5.3 from molecule_plugins
    containers:23.5.3 from molecule_plugins requiring collections: ansible.posix>=1.3.0 community.docker>=1.9.1 containers.podman>=1.8.1
    default:24.9.0 from molecule
    docker:23.5.3 from molecule_plugins requiring collections: community.docker>=3.4.11 ansible.posix>=1.4.0
    ec2:23.5.3 from molecule_plugins
    gce:23.5.3 from molecule_plugins requiring collections: google.cloud>=1.0.2 community.crypto>=1.8.0
    openstack:23.5.3 from molecule_plugins requiring collections: openstack.cloud>=2.1.0
    podman:23.5.3 from molecule_plugins requiring collections: containers.podman>=1.7.0 ansible.posix>=1.3.0
    vagrant:23.5.3 from molecule_plugins
```

## Further links

* [borisskert/molecule @ Docker Hub](https://hub.docker.com/repository/docker/borisskert/molecule)
