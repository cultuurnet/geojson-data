#!/bin/bash

ROOT_DIR="$(cd "$(dirname ${BASH_SOURCE[0]})" && pwd)"
REQUIRED_COMMANDS=(jq)

for cmd in "${REQUIRED_COMMANDS[@]}"
do
    command -v ${cmd} > /dev/null 2>&1 || \
    { echo >&2 "I require ${cmd} but it's not installed. Aborting."; exit 1 }
done

geojson_dir=${1:-${ROOT_DIR}/geojson}
elasticsearch_dir=${2:-${ROOT_DIR}/elasticsearch}

for file in $(find ${geojson_dir} -type f -name '*.geojson'); do
    output_dir="$(dirname ${elasticsearch_dir}/${file#${geojson_dir}/})"
    output_file="$(basename ${file%.geojson}.json)"

    [ -d ${output_dir} ] || mkdir -p ${output_dir}
    jq '. | {location:.geometry}' ${file} > ${output_dir}/${output_file}
    echo "Created ${output_dir}/${output_file}"
done
