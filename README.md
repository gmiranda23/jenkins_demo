# jenkins_demo

Sets up a Jenkins server & a job to build habitat plans.

Usage:

1. `berks install && berks upload` 
2. Bootstrap a node with recipe `jenkins_demo`
3. Trigger the job at any time by creating a push job to run `jenkins_demo::run_job`
