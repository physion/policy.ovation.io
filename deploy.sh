#!/bin/sh

if [[ $# -eq 0 ]] ; then
    echo 'must specify a release version tag'
    exit 0
fi

RELEASE_VERSION=$1

git tag ${RELEASE_VERSION}
git push --tags

sed "s/___VERSION___/${RELEASE_VERSION}/" mkdocs_template.yml > mkdocs.yml

mkdocs gh-deploy --ignore-version --clean -m "Deploy ${RELEASE_VERSION}"
