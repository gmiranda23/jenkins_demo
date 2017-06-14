# jenkins_demo

## Description
Sets up a Jenkins server & a job to build habitat plans.

This demonstrates:
* Chef integration with Jenkins
* Habitat integration with Jenkins
* Automated management of Jenkins jobs
* Automated installation/configuration of Jenkins plugins
* Use of Chef (think: via push-jobs) to kick off Jenkins jobs
* Originates parameters via Chef that carry through a Jenkins pipeline
* Generation of fingerprints to track .hart artifacts
* A basic pipeline to manage Docker images using habitat

The demo includes a basic pipeline view of two dependent jobs.  If you can install
plugins, configure them, and execute them arbitrarily: go nuts you Jenkins pro, you!
This is meant to show working moving pieces, not a production workflow.

## Usage
1. `berks install && berks upload`
2. Bootstrap a node with recipe `jenkins_demo`
3. Trigger the job at any time by creating a push job to run `jenkins_demo::run_job`

## Platforms
Only tested on Ubuntu 16 (PR's welcome!)

## Attributes
- `['jenkins_demo']['job_parameter']['origin']` - The hab origin name to use.
Presently, the demo creates arbitrary keys it throws away during each run.

- `['jenkins_demo']['job_parameter']['pkg']` - The name of the hab package you
want to build. Demo expects the plan path in your repo to be $PKG/plan.sh

- `['jenkins_demo']['job_parameter']['repo']` - Name of the github repo containing
your hab plan.sh file.  Demo builds artifacts from 'habitat-sh/core-plans'.

## License and Authors

* Author: George Miranda [gmiranda@chef.io](mailto:gmiranda@chef.io)

```text
Copyright 2017, Chef Software, Inc

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
