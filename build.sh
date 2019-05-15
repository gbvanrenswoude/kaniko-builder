#!/busybox/sh

if [ "x$DOCKERFILE_NAME" = 'x' ]; then
  DOCKERFILE_NAME="Dockerfile"
fi

if [ "x$TAG" = 'x' ]; then
  TAG="latest"
fi

if [ "x$REGISTRY" = 'x' ]; then
  echo "Set REGISTRY"
  exit 1
fi

if [ "x$USERNAME" = 'x' ]; then
  echo "Set USERNAME"
  exit 1
fi

if [ "x$PASSWORD" = 'x' ]; then
  echo "Set PASSWORD"
  exit 1
fi

if [ "x$DIR" = 'x' ]; then
  echo "Set Dockerbuild context path using $DIR"
  exit 1
fi

if [ "x$IMAGE_NAME" = 'x' ]; then
  echo "Set IMAGE_NAME"
  exit 1
fi

echo "{\"auths\":{\"$REGISTRY\":{\"username\":\"$USERNAME\",\"password\":\"$PASSWORD\"}}}" > /kaniko/.docker/config.json
/kaniko/executor --context $DIR --dockerfile $DIR/$DOCKERFILE_NAME --destination $REGISTRY/${IMAGE_NAME}:${TAG}
