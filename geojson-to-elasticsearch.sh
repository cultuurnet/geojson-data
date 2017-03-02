#!/bin/bash

geojson_dir=${1:-'./geojson'};
elasticsearch_dir=${2:-'./elasticsearch'};

cp -R $geojson_dir/* $elasticsearch_dir;

files=$(find $elasticsearch_dir -name '*.geojson');

for file in $files; do
  if [ -f "$file" ]; then
    without_extension=${file%.*};
    json_file=$without_extension.json;
    
    touch $json_file;
	  jq '. | {location:.geometry}' $file > $json_file;
    
    rm $file;
    
    echo "Created $json_file";
  fi
done
