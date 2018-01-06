#!/bin/bash
set -ev

#-------------------------------------------------------------------------------
# Install JHipster Dependencies
#-------------------------------------------------------------------------------
cd $TRAVIS_BUILD_DIR
if [[ "$JHIPSTER_DEPENDENCIES_BRANCH" != "release" ]]; then
    git clone "$JHIPSTER_DEPENDENCIES_REPO" jhipster-dependencies
    cd jhipster-dependencies
    if [ "$JHIPSTER_DEPENDENCIES_BRANCH" == "latest" ]; then
        LATEST=$(git describe --abbrev=0)
        git checkout -b $LATEST $LATEST
    elif [ "$JHIPSTER_DEPENDENCIES_BRANCH" != "master" ]; then
        git checkout -b $JHIPSTER_DEPENDENCIES_BRANCH origin/$JHIPSTER_DEPENDENCIES_BRANCH
    fi
    git --no-pager log -n 10 --graph --pretty='%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit

    ./mvnw clean install -Dgpg.skip=true
    ls -al ~/.m2/repository/io/github/jhipster/jhipster-dependencies/
fi

#-------------------------------------------------------------------------------
# Install JHipster lib
#-------------------------------------------------------------------------------
cd $TRAVIS_BUILD_DIR
if [[ "$JHIPSTER_LIB_BRANCH" != "release" ]]; then
    git clone "$JHIPSTER_LIB_REPO" jhipster
    cd jhipster
    if [ "$JHIPSTER_LIB_BRANCH" == "latest" ]; then
        LATEST=$(git describe --abbrev=0)
        git checkout -b $LATEST $LATEST
    elif [ "$JHIPSTER_LIB_BRANCH" != "master" ]; then
        git checkout -b $JHIPSTER_LIB_BRANCH origin/$JHIPSTER_LIB_BRANCH
    fi
    git --no-pager log -n 10 --graph --pretty='%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit

    ./mvnw clean install -Dgpg.skip=true
    ls -al ~/.m2/repository/io/github/jhipster/jhipster/
fi

#-------------------------------------------------------------------------------
# Install JHipster Generator
#-------------------------------------------------------------------------------
cd $TRAVIS_BUILD_DIR
git clone $JHIPSTER_REPO generator-jhipster
cd generator-jhipster
if [ "$JHIPSTER_BRANCH" == "latest" ]; then
    LATEST=$(git describe --abbrev=0)
    git checkout -b $LATEST $LATEST
elif [ "$JHIPSTER_BRANCH" != "master" ]; then
    git checkout -b $JHIPSTER_BRANCH origin/$JHIPSTER_BRANCH
fi
git --no-pager log -n 10 --graph --pretty='%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit

yarn install
yarn global add file:"$TRAVIS_BUILD_DIR"/generator-jhipster
