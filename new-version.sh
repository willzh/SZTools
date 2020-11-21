#!/bin/sh

# 修改以下两项
pod_version=1.0.25
commit_msg="fix bugs"

# 提交到 git
git add .
git commit -m "${commit_msg}"
git push origin master

git tag -m "${commit_msg}" ${pod_version}
git push origin ${pod_version}

# 提交到 pod
pod trunk push
