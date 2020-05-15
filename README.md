# molecule action

This action runs [molecule](https://github.com/ansible-community/molecule#ansible-molecule) within a [docker image](https://github.com/borisskert/docker-molecule).

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
