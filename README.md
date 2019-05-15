# kaniko-builder

Build docker images without needing privileged access in a second.

### Image
gbvanrenswoude/kaniko-builder:latest

### env var configuration
- `DOCKERFILE_NAME`: *Optional.* Dockerfile name. Defaults to `Dockerfile`.
- `REGISTRY`: *Required.* Name of the registry that kaniko will push to.
- `USERNAME`: *Required.* Username used to access the registry.
- `PASSWORD`: *Required.* Password used to access the registry.
- `DIR`: *Required.* Your project dir. For example in GitlabCI: `$CI_PROJECT_DIR`.
- `IMAGE_NAME`: *Required.* Image name.
- `TAG`: *Optional.* Image tag. Defaults to `latest`.

### Example GitlabCI (docker executor) usage:
```yml
build:
  stage: test
  image: gbvanrenswoude/kaniko-builder
  variables:
    REGISTRY: ${ARTIFACTORY_URL}
    USERNAME: ${ARTIFACTORY_USERNAME}
    PASSWORD: ${ARTIFACTORY_PW}
    DIR: ${CI_PROJECT_DIR}
    IMAGE_NAME: concourse
    TAG: ${CI_COMMIT_SHORT_SHA}
  script:
    - /build.sh
  tags:
    - test
```

### TODO
- ECR support.
