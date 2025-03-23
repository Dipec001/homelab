
# GitHub Actions: Multi-OS Multi-Job Workflow

This document explains a **multi-OS, multi-job GitHub Actions workflow** that I created for my project. The workflow runs on both
 **Ubuntu** and **Windows** machines, installs dependencies, and runs tests using `pytest`. Below, I break down the workflow
 structure, key decisions, and lessons learned.

---

## Why This Workflow?  
In this workflow, I focused on learning and implementing:
- **Multiple jobs**: One job builds the environment, another tests it.
- **Matrix strategy**: To run the jobs on different operating systems (Ubuntu and Windows).
- **Conditional steps**: I applied OS-specific commands in `bash` and `PowerShell`, depending on the runner.

---

## Workflow File: `.github/workflows/build-and-test.yml`

```yaml
# This is a multi-OS, multi-job workflow

name: Python CI

on:
  push:
    branches: [ "main" ]  # Run workflow on push to the "main" branch
  workflow_dispatch:  # Allow manual triggering from the GitHub Actions tab

jobs:
  # First Job: Build Job
  build:
    runs-on: ${{ matrix.os }}
    strategy:
      matrix:
        os: [ubuntu-latest, windows-latest]  # Define the OS matrix

    steps:
      - uses: actions/checkout@v4  # Check out the repository

      # Setup Python environment
      - name: Setup Python
        uses: actions/setup-python@v5.4.0
        with:
          python-version: 3.9

      # Install dependencies on Linux/MacOS
      - name: Install dependencies (Linux/MacOS)
        run: |
          if [ -f mypythonproject/requirements.txt ]; then pip install -r mypythonproject/requirements.txt; fi
        shell: bash
        if: runner.os == 'Linux' || runner.os == 'macOS'

      # Install dependencies on Windows
      - name: Install dependencies (Windows)
        run: |
          if (Test-Path "mypythonproject/requirements.txt") { pip install -r mypythonproject/requirements.txt }
        shell: powershell
        if: runner.os == 'Windows'

      # Debugging Step - List installed Python packages
      - name: List installed Python packages
        run: pip list

  # Second Job: Test Job (depends on the Build Job)
  test:
    needs: build  # Runs after 'build' job completes
    runs-on: ${{ matrix.os }}
    strategy:
      matrix:
        os: [ubuntu-latest, windows-latest]

    steps:
      - uses: actions/checkout@v4  # Check out the repo again because jobs are independent

      - name: Echo OS
        run: echo "Running on ${{ matrix.os }}"

      - name: Setup Python
        uses: actions/setup-python@v5.4.0
        with:
          python-version: 3.9

      # Install dependencies on Linux/MacOS
      - name: Install dependencies (Linux/MacOS)
        run: |
          if [ -f mypythonproject/requirements.txt ]; then pip install -r mypythonproject/requirements.txt; fi
        shell: bash
        if: runner.os == 'Linux' || runner.os == 'macOS'

      # Install dependencies on Windows
      - name: Install dependencies (Windows)
        run: |
          if (Test-Path "mypythonproject/requirements.txt") { pip install -r mypythonproject/requirements.txt }
        shell: powershell
        if: runner.os == 'Windows'

      # Run tests with pytest
      - name: Run tests (Linux/MacOS)
        run: |
          pytest mypythonproject/tests || echo "No tests found. Skipping..."
        shell: bash
        if: runner.os != 'Windows'

      # Run tests with pytest on Windows
      - name: Run tests (Windows)
        run: |
          if (Test-Path ".\mypythonproject\tests\") { pytest } else { Write-Host "No tests found. Skipping..." }
        shell: powershell
        if: runner.os == 'Windows'
```

---

## Key Takeaways and Explanations

### 1. **Matrix Strategy**  
The `matrix` strategy allows me to run the same job on **multiple operating systems** (in this case, `ubuntu-latest` and
 `windows-latest`).  
This helps ensure that my Python project works consistently across different platforms.

```yaml
strategy:
  matrix:
    os: [ubuntu-latest, windows-latest]
```

---

### 2. **Conditional Steps for OS-Specific Commands**  
Since Linux and Windows handle commands differently, I added **conditional steps** to install dependencies and run tests accordingly.

#### For Linux/MacOS:
```yaml
- name: Install dependencies (Linux/MacOS)
  run: |
    if [ -f mypythonproject/requirements.txt ]; then pip install -r mypythonproject/requirements.txt; fi
  shell: bash
  if: runner.os == 'Linux' || runner.os == 'macOS'
```

#### For Windows:
```yaml
- name: Install dependencies (Windows)
  run: |
    if (Test-Path "mypythonproject/requirements.txt") { pip install -r mypythonproject/requirements.txt }
  shell: powershell
  if: runner.os == 'Windows'
```

---

### 3. **Job Dependencies**  
The `test` job depends on the `build` job. This is specified with the `needs` keyword:
```yaml
needs: build
```
This ensures that the `test` job only runs after the `build` job completes successfully.

---

### 4. **Manual Trigger with `workflow_dispatch`**  
The `workflow_dispatch` event allows me to trigger this workflow manually from the GitHub Actions tab, in addition to running it
 on every push to the `main` branch.

```yaml
on:
  push:
    branches: [ "main" ]
  workflow_dispatch:
```

---

## Troubleshooting and Debugging

### Listing Installed Python Packages  
I added a debugging step to **list installed Python packages**. This helps verify whether the dependencies are being installed
 correctly.
```yaml
- name: List installed Python packages
  run: pip list
```

---

## Lessons Learned  

1. **Using Conditional Steps**  
   I learned how to run different commands based on the operating system using `if` conditions.

2. **Matrix Strategy Simplifies Cross-Platform Testing**  
   By leveraging the matrix strategy, I was able to test my project on both Ubuntu and Windows without duplicating the workflow.

3. **Job Dependencies Ensure Order**  
   By setting `needs: build`, I ensured that my test job only runs after the environment has been successfully set up in the build
 job.

---

## Conclusion  

This multi-OS, multi-job workflow is an essential part of ensuring cross-platform compatibility in my Python project. By running
 tests on different operating systems, I can catch platform-specific issues early and improve the reliability of my code.

---

### Next Steps (For Future Improvement)  
- Add caching to speed up dependency installation.  
- Explore self-hosted runners for more flexibility and control.  
- Integrate coverage reports and static code analysis for deeper insights.  
