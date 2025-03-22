# Test CI Workflow

## Overview  
This workflow is a basic example that runs on every push and pull request to the `main` branch and prints "Hello World" and my
 name in the logs.

## YAML Code  
The full workflow YAML file is stored in `../examples/test-ci.yml`.

```yaml
# This is a basic workflow to help you get started with Actions

name: Test CI

# Controls when the workflow will run
on:
  # Triggers the workflow on push or pull request events but only for the "main" branch
  push:
    branches: [ "main" ]
  pull_request:
    branches: [ "main" ]

  # Allows you to run this workflow manually from the Actions tab
  workflow_dispatch:

# A workflow run is made up of one or more jobs that can run sequentially or in parallel
jobs:
  # This workflow contains a single job called "build"
  build:
    # The type of runner that the job will run on
    runs-on: ubuntu-latest

    # Steps represent a sequence of tasks that will be executed as part of the job
    steps:
      # Checks-out your repository under $GITHUB_WORKSPACE, so your job can access it
      - name: Check out the repository
      - uses: actions/checkout@v4

      # Runs a single command using the runners shell
      - name: Run a one-line script
        run: echo "Hello, world!"

      # Runs a set of commands using the runners shell
      # - name: Run a multi-line script
      #   run: |
      #     echo Add other actions to build,
      #     echo test, and deploy your project.
```
## Explanation of Key Parts
**Triggers:**

- push → This workflow runs every time a commit is pushed to the main branch.
- pull_request → Runs on every PR targeting the main branch.
- workflow_dispatch → Allows manual execution from the Actions tab.

**Jobs and Steps:**

- Job: build: Runs the job on an ubuntu-latest runner.
- Step 1: Check out the repository: Downloads your repository files so they can be used in the workflow.
- Step 2: Run a script: Prints "Hello World" and my name.

**Key Learnings and Notes**
- Learned how to configure basic workflow triggers and run shell commands in GitHub Actions.
- This workflow can be expanded later by adding more jobs or steps, such as running tests or deploying code.
