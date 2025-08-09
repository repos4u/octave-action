# Action for Running Octave
[![Test Action](https://github.com/repos4u/octave-action/actions/workflows/test-actions.yml/badge.svg)](https://github.com/repos4u/octave-action/actions/workflows/test-actions.yml)

This action enables to run GNU Octave tests on [GitHub&reg;-hosted](https://docs.github.com/en/free-pro-team@latest/actions/reference/specifications-for-github-hosted-runners) runners:

- Currently, this action sets up only the latest octave release

## Examples
To use this action on GitHub-hosted runner, see the following example

### Run Octave Tests on Github-Hosted Runner

```yaml
name: Run Octave Tests on Github-Hosted Runner
on: [push]
jobs:
  my-job:
    runs-on: ubuntu-latest
    steps:
      - name: Check out repository
        uses: actions/checkout@v3
      - name: Run tests
        uses: repos4u/octave-action@v1
        with:
          command: disp('Use any octave command here');
```
