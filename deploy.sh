#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Build the project.
~/Bureau/hugo_0.18.1_linux_amd64/hugo_0.18.1_linux_amd64 # if using a theme, replace by `hugo -t <yourtheme>`

# clean source
rm -rf ../labsim.github.io/*

# install new site
cp -R public/* ../labsim.github.io

# Go To Public folder
cd ../labsim.github.io/

# Add changes to git.
git add -A

# Commit changes.
msg="rebuilding site `date`"
git commit -m "$msg"

# Push website source
git push origin master

# Come Back
cd -

# clean home
rm -rf public

# Push content source
git add -A
msg="commiting fresh content"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"
git push origin master
