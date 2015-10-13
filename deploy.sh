#!/bin/sh

RELEASE_VERSION=$1

git tag v${RELEASE_VERSION}
git push --tags

mkdocs clean
mkdocs gh-deploy
