#!/bin/bash

# Fetch all branches from the remote
git fetch --all

# Loop through each remote branch and create a local branch
for branch in $(git branch -r | grep -v '\->'); do
    local_branch=${branch#origin/}
    git branch --track $local_branch $branch 2>/dev/null
done

# Pull the latest changes for each branch
for branch in $(git for-each-ref --format '%(refname:short)' refs/heads/); do
    git checkout $branch
    git pull
done