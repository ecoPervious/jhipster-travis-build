#!/bin/bash

#-------------------------------------------------------------------------------
# Force no insight
#-------------------------------------------------------------------------------
mkdir -p "$HOME"/.config/configstore/
mv "$JHIPSTER_TRAVIS"/configstore/*.json "$HOME"/.config/configstore/

#-------------------------------------------------------------------------------
# Generate the project with yo jhipster
#-------------------------------------------------------------------------------
if [ "$JHIPSTER" == "app-gateway-uaa" ]; then
    mkdir -p "$HOME"/uaa
    mv -f "$JHIPSTER_SAMPLES"/uaa/.yo-rc.json "$HOME"/uaa/
    cd "$HOME"/uaa
    yarn link generator-jhipster
    yo jhipster --force --no-insight --with-entities
    ls -al "$HOME"/uaa
fi

mkdir -p "$APP_FOLDER"
mv -f "$JHIPSTER_SAMPLES"/"$JHIPSTER"/.yo-rc.json "$APP_FOLDER"/
cd "$APP_FOLDER"
yarn link generator-jhipster
yo jhipster --force --no-insight --skip-checks --with-entities
ls -al "$APP_FOLDER"
