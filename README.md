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

This image is based on `alpine:3` and contains:

* python3
* molecule 3.3.4
* ansible 2.11.1
* ansible-lint 5.0.12
* yamllint 1.26.1
* molecule-docker - the molecule docker driver
* docker - cli and python package; used by the molecule docker driver.
* git - Used to checkout git repositories

## Usage

Due to docker entrypoint is `molecule` the usage is quite simple:

```shell script
$ docker run --rm borisskert/molecule:latest --version
molecule 3.3.4 using python 3.8 
    ansible:2.11.1
    delegated:3.3.4 from molecule
    docker:0.2.4 from molecule_docker
```

## Further links

* [borisskert/molecule @ Docker Hub](https://hub.docker.com/repository/docker/borisskert/molecule)
