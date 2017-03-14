#!/bin/bash
set -e

#-------------------------------------------------------------------------------
# Functions
#-------------------------------------------------------------------------------
moveEntity() {
    local entity="$1"
    cp "$JHIPSTER_SAMPLES"/.jhipster/"$entity".json "$HOME"/app/.jhipster/
}

#-------------------------------------------------------------------------------
# Copy entities json
#-------------------------------------------------------------------------------

rm -Rf "$APP_FOLDER"
mkdir -p "$APP_FOLDER"/.jhipster/

if [[ ("$JHIPSTER" == "app-ng2-mongodb") || ("$JHIPSTER" == "app-mongodb") || ("$JHIPSTER" == "app-gradle-mongodb") ]]; then
    moveEntity MongoBankAccount

    moveEntity FieldTestEntity
    moveEntity FieldTestMapstructEntity
    moveEntity FieldTestServiceClassEntity
    moveEntity FieldTestServiceImplEntity
    moveEntity FieldTestInfiniteScrollEntity
    moveEntity FieldTestPagerEntity
    moveEntity FieldTestPaginationEntity

elif [[ ("$JHIPSTER" == "app-ng2-cassandra") || "$JHIPSTER" == "app-cassandra" || ("$JHIPSTER" == "app-gradle-cassandra") ]]; then
    moveEntity CassBankAccount

    moveEntity CassTestEntity
    moveEntity CassTestMapstructEntity
    moveEntity CassTestServiceClassEntity
    moveEntity CassTestServiceImplEntity

elif [[ ("$JHIPSTER" == "app-microservice-eureka") || ("$JHIPSTER" == "app-microservice-consul") ]]; then
    moveEntity MicroserviceBankAccount
    moveEntity MicroserviceOperation
    moveEntity MicroserviceLabel

    moveEntity FieldTestEntity
    moveEntity FieldTestMapstructEntity
    moveEntity FieldTestServiceClassEntity
    moveEntity FieldTestServiceImplEntity
    moveEntity FieldTestInfiniteScrollEntity
    moveEntity FieldTestPagerEntity
    moveEntity FieldTestPaginationEntity

elif [[ ("$JHIPSTER" == "app-mysql") || ("$JHIPSTER" == "app-ng2-psql-es-noi18n") || ("$JHIPSTER" == "app-psql-es-noi18n") ]]; then
    moveEntity BankAccount
    moveEntity Label
    moveEntity Operation

    moveEntity FieldTestEntity
    moveEntity FieldTestMapstructEntity
    moveEntity FieldTestServiceClassEntity
    moveEntity FieldTestServiceImplEntity
    moveEntity FieldTestInfiniteScrollEntity
    moveEntity FieldTestPagerEntity
    moveEntity FieldTestPaginationEntity

    moveEntity TestEntity
    moveEntity TestMapstruct
    moveEntity TestServiceClass
    moveEntity TestServiceImpl
    moveEntity TestInfiniteScroll
    moveEntity TestPager
    moveEntity TestPagination
    moveEntity TestManyToOne
    moveEntity TestManyToMany
    moveEntity TestOneToOne
    moveEntity TestCustomTableName
    moveEntity TestTwoRelationshipsSameEntity

    moveEntity EntityWithDTO
    moveEntity EntityWithPagination
    moveEntity EntityWithPaginationAndDTO
    moveEntity EntityWithServiceClass
    moveEntity EntityWithServiceClassAndDTO
    moveEntity EntityWithServiceClassAndPagination
    moveEntity EntityWithServiceClassPaginationAndDTO
    moveEntity EntityWithServiceImpl
    moveEntity EntityWithServiceImplAndDTO
    moveEntity EntityWithServiceImplAndPagination
    moveEntity EntityWithServiceImplPaginationAndDTO

elif [[ ("$JHIPSTER" == "app-ng2-gateway-uaa") || ("$JHIPSTER" == "app-gateway-uaa") ]]; then
    moveEntity FieldTestEntity
    moveEntity FieldTestMapstructEntity
    moveEntity FieldTestServiceClassEntity
    moveEntity FieldTestServiceImplEntity
    moveEntity FieldTestInfiniteScrollEntity
    moveEntity FieldTestPagerEntity
    moveEntity FieldTestPaginationEntity

else
    moveEntity BankAccount
    moveEntity Label
    moveEntity Operation

    moveEntity FieldTestEntity
    moveEntity FieldTestMapstructEntity
    moveEntity FieldTestServiceClassEntity
    moveEntity FieldTestServiceImplEntity
    moveEntity FieldTestInfiniteScrollEntity
    moveEntity FieldTestPagerEntity
    moveEntity FieldTestPaginationEntity

    moveEntity EntityWithDTO
    moveEntity EntityWithPagination
    moveEntity EntityWithPaginationAndDTO
    moveEntity EntityWithServiceClass
    moveEntity EntityWithServiceClassAndDTO
    moveEntity EntityWithServiceClassAndPagination
    moveEntity EntityWithServiceClassPaginationAndDTO
    moveEntity EntityWithServiceImpl
    moveEntity EntityWithServiceImplAndDTO
    moveEntity EntityWithServiceImplAndPagination
    moveEntity EntityWithServiceImplPaginationAndDTO
fi

ls -l "$APP_FOLDER"/.jhipster/
