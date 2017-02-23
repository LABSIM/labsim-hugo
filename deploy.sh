#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Build the project.
~/Bureau/hugo_0.18.1_linux_amd64/hugo_0.18.1_linux_amd64 # if using a theme, replace by `hugo -t <yourtheme>`

# Go To Public folder
cd public/

# Add changes to git.
git add -A

# Commit changes.
msg="rebuilding site `date` & publishing"
git commit -m "$msg"

# Push website source
git push origin master

# Come Back
cd ..

# Push content source
git add -A
msg="commiting fresh content"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"
git push origin master
