#!/bin/bash
set -e
set -x

# Get the directory of the current script
SCRIPT_DIR=$(dirname "$(readlink -f "$0")")

rm -rf $SCRIPT_DIR/../airbyte/airbyte-integrations/connectors/destination-starrocks
cp -r $SCRIPT_DIR/destination-starrocks  $SCRIPT_DIR/../airbyte/airbyte-integrations/connectors


# this script assumes that ai
pushd $SCRIPT_DIR/../airbyte/

# build the code
./gradlew :airbyte-integrations:connectors:destination-starrocks:airbyteDocker

# push the dev image
docker tag milanmosny/destination-starrocks:dev milanmosny/destination-starrocks:0.1.1-dev-1

docker push milanmosny/destination-starrocks:dev
docker push milanmosny/destination-starrocks:0.1.1-dev-1