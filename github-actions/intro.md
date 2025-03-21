## Github Actions
- **What is Github actions:** This is a CI/CD platform that allows us to automate our build, test and deployment pipelines.
- **Workflows:** These are configurable automated process that will run one or more jobs. Workflows are defined by a YAML file checked
 in to your repository and will run when triggered by an event in your repository, or they can be triggered manually, or at a
 defined schedule.The events could be a push, pr, issue creation etc
 Workflows are defined in the *.github/workflows* directory in a repository and a repo can contain multiple workflows

- **Events:** An event is a specific activity in a repository that triggers a workflow run. For example, an activity can originate
 from GitHub when someone creates a pull request, opens an issue, or pushes a commit to a repository.There are so many events
that could trigger a workflow, you can see them <a href="https://docs.github.com/en/actions/writing-workflows/choosing-when-your-workflow-runs/events-that-trigger-workflows">here</a>
- **Jobs:** A job is a set of steps in a workflow that is executed on the same runner. Each step is either a shell script that
 will be executed, or an action that will be run. Steps are executed in order and are dependent on each other.
- **Actions:** An action is a custom application for the GitHub Actions platform that performs a complex but frequently repeated
 task. Use an action to help reduce the amount of repetitive code that you write in your workflow files

- **job_id:** This is the string given to the job, it is at the location of `jobs.<job_id>`. It is a unique identifier given to
the particular job in the workflow. The string must start with a letter or an _
- **job name:** THis is a name given to the job, it is at `jobs.<job_id>.name`. 
- **needs:** THis is used to specify jobs that must complete before other jobs. it is specified at `jobs.<job_id>.needs`
**Example:** Requiring successful dependent jobs
jobs:
  job1:
  job2:
    needs: job1
  job3:
    needs: [job1, job2]
In this example, job1 must complete successfully before job2 begins, and job3 waits for both job1 and job2 to complete.

The jobs in this example run sequentially:

job1
job2
job3
