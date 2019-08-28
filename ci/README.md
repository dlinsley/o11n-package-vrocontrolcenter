# Concourse - Pipelines

These pipelines depends on the following secrets defined in a Concourse integrated CredHub or Vault:
 - /concourse/`team name`/s3-access-key
 - /concourse/`team name`/s3-secret-key
 - /concourse/`team name`/s3-endpoint
 - /concourse/`team name`/github-access-token
 - /concourse/`team name`/harbor-host
 - /concourse/`team name`/harbor-user.username
 - /concourse/`team name`/harbor-user.password
 - /concourse/`team name`/vro-deploy-hosts
 - /concourse/`team name`/vro-deploy-user.username
 - /concourse/`team name`/vro-deploy-user.password 
`team name` is typically main


Most of these pipelines depend on a docker container that is ready to execute maven for creating orchestrator .package files.  See https://github.com/dlinsley/docker-o11n-maven for details on creating one.


## Build packages

This concourse pipeline:
 - Tracks a build version in an S3 compatible object store
 - Tracks changes on master branch of this repo
 - Builds .package files
 - Creates a github release with the compiled .package files.
 - Tags the release as pre-release with a version number

The pipeline is defined by [build_pipeline.yml](build_pipeline.yml)

 Add or update it on your concourse using:
 ``` bash
 ./00_set-build-pipeline.sh
 ```

## Push Packages

This concourse pipeline:
 - Watches for any new `released` github release at (https://github.com/dlinsley/o11n-package-vrocontrolcenter/releases) 
 - Pushes the .package files from the github release to one or more vRO instances

The pipeline is defined by [push_pipeline.yml](push_pipeline.yml)

 Add or update it on your concourse using:
 ``` bash
 ./00_set-push-pipeline.sh
 ```

## Build and Push Packages

This pipeline is useful if your team is not able to use github releases for artifact management.

This concourse pipeline:
 - Tracks a build version in an S3 compatible object store
 - Tracks changes on master branch of this repo
 - Builds .package files
 - Pushes the .package files to one or more vRO instances.

The pipeline is defined by [build_and_push_pipeline.yml](build_and_push_pipeline.yml)

 Add or update it on your concourse using:
 ``` bash
 ./00_set-build-push-pipeline.sh
 ```
