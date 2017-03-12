#!/bin/bash

#-------------------------------------------------------------------------------
# Check Javadoc generation
#-------------------------------------------------------------------------------
if [ -f "mvnw" ]; then
    ./mvnw javadoc:javadoc
elif [ -f "gradlew" ]; then
    ./gradlew javadoc
fi

#-------------------------------------------------------------------------------
# Launch UAA tests
#-------------------------------------------------------------------------------
if [ "$JHIPSTER" == "app-gateway-uaa" ]; then
    cd "$HOME"/uaa
    ./mvnw test
fi

#-------------------------------------------------------------------------------
# Launch tests
#-------------------------------------------------------------------------------
cd "$APP_FOLDER"
if [ -f "mvnw" ]; then
    ./mvnw test \
        -Dlogging.level.io.github.jhipster.sample=ERROR \
        -Dlogging.level.io.github.jhipster.travis=ERROR
elif [ -f "gradlew" ]; then
    ./gradlew test \
        -Dlogging.level.io.github.jhipster.sample=ERROR \
        -Dlogging.level.io.github.jhipster.travis=ERROR
fi
if [ -f "gulpfile.js" ]; then
    gulp test --no-notification
fi
if [ -f "tsconfig.json" ]; then
    yarn run test
fi
