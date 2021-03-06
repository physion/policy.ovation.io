#!/bin/sh

if [[ $# -eq 0 ]] ; then
    echo 'must specify a release version tag'
    exit 0
fi

RELEASE_VERSION=$1

sed "s/___VERSION___/${RELEASE_VERSION}/" mkdocs_template.yml > mkdocs.yml

mkdocs build
