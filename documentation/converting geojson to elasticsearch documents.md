# Converting GeoJSON to ElasticSearch documents

## Prerequisites
* [jq](https://stedolan.github.io/jq/) - a lightweight and flexible command-line JSON processor.

## Procedure

The UDB3 ElasticSearch index for geoshapes expects the files to be structured in a specific way.

Before you convert the geodata from `.geojson` to `.json` files that ElasticSearch can index, make sure you empty the existing `elasticsearch` directory first.

	rm -R elasticsearch/*

To actually convert the files, use the shell script located in the root of this repository:

	sh ./geojson-to-elasticsearch.sh
