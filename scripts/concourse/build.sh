#!/bin/bash

pushd cedar
CEDAR_REV=$(git rev-parse HEAD)
popd

cd pck
git submodule update --init

pushd Externals/Cedar
git fetch
git checkout ${CEDAR_REV}
popd

echo Running tests against SDK Version: ${CEDAR_SDK_RUNTIME_VERSION}

rake travis

