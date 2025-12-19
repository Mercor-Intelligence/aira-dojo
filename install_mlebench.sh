#!/bin/bash
set -e
pushd src/dojo/tasks/mlebench
git clone --depth 1 https://github.com/Mercor-Intelligence/meta-mle-task-creation-delivery.git
pushd meta-mle-task-creation-delivery
git fetch --depth 1 origin 26e3050c8371780e7c0031d9600ad99772eae6c5
git checkout FETCH_HEAD
git lfs fetch --all
git lfs pull
sed -i '29s/.*/cache = dc.Cache(size_limit=2\*\*26)/g' mlebench/data.py
pip install -e .
popd
popd
