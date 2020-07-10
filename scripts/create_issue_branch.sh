#!/bin/bash

# current Git branch
branch=$(git rev-parse --abbrev-ref HEAD)

# 89, 1, 20
issueNumber=$1

# feature-x-y-z
branchName=$2

# establish branch and tag name variables
releaseBranch=$issueNumber-$branchName
echo "Creating branch $releaseBranch"
git stash
git branch $releaseBranch
git checkout $releaseBranch
git push --set-upstream origin $releaseBranch
git checkout $branch
git stash pop
