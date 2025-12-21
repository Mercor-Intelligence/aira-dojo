#!/bin/bash
set -e
pushd src/dojo/tasks/mlebench
git clone --depth 1 https://github.com/Mercor-Intelligence/meta-mle-task-creation-delivery.git
pushd meta-mle-task-creation-delivery
git fetch --depth 1 origin d706038c20cccdcd3eacb5c3f84c5c3bd9dac285
git checkout FETCH_HEAD
git lfs fetch --all
git lfs pull
sed -i '29s/.*/cache = dc.Cache(size_limit=2\*\*26)/g' mlebench/data.py
pip install -e .
popd
popd
