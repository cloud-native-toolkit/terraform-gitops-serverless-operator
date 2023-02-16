#!/usr/bin/env bash

SCRIPT_DIR=$(cd $(dirname "$0"); pwd -P)
MODULE_DIR=$(cd "${SCRIPT_DIR}/.."; pwd -P)
CHART_DIR=$(cd "${MODULE_DIR}/charts/knative-serving-operator"; pwd -P)

NAME="$1"
DEST_DIR="$2"

## Debug

echo "NAME: $NAME"
echo "DEST_DIR: $DEST_DIR"
echo "MODULE_DIR: $MODULE_DIR"
echo "CHART_DIR: $CHART_DIR"

## Add logic here to put the yaml resource content in DEST_DIR

cp -R "${CHART_DIR}"/* "${DEST_DIR}"

echo "${VALUES_CONTENT}" > "${DEST_DIR}/values.yaml"

find "${DEST_DIR}" -name "*"
