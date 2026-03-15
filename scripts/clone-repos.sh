#!/bin/bash

# Clone 'delta' if needed
if [ ! -d "delta" ]; then
  git clone git@github.com:dandavison/delta.git
fi

# Clone 'git-fuzzy' if needed
if [ ! -d "git-fuzzy" ]; then
  git clone git@github.com:bigH/git-fuzzy.git
fi
