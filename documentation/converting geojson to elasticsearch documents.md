# Converting GeoJSON to ElasticSearch documents

The UDB3 ElasticSearch index for geoshapes expects the files to be structured in a specific way.

Before we convert the geodata from `.geojson` to `.json` files that ElasticSearch can index, make sure you empty the existing `elasticsearch` directory first.

	rm -R elasticsearch/*;

To actually convert the files, use the shell script located in the root of this repository:

	./geojson-to-elasticsearch.sh
	
It may be necessary to make it executable first:

	chmod +x ./geojson-to-elasticsearch.sh