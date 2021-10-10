#!/usr/bin/env bash

set -ex

DIR=$(pwd)
TMP=$DIR/tmp

mkdir -p $TMP
unzip -d $TMP -o "$DIR/data/World Country Polygons - Very High Definition.zip"

ogr2ogr -f GeoJSONSeq /dev/stdout $TMP/WB_countries_Admin0_10m/WB_countries_Admin0_10m.shp  \
| node $DIR/src/filter.js \
| tippecanoe --no-tile-compression --maximum-zoom=6 --minimum-zoom=0 -o $TMP/wb_countries.mbtiles --force

tile-join \
    --force \
    --no-tile-compression \
    -n "worldbank-country-polygons-tiles" \
    -N "World Country Polygons by WorldBank for Open Reverse Geocoder" \
    -A "©WorldBank" \
    --output-to-directory=$DIR/docs/tiles \
    --no-tile-size-limit $DIR/tmp/wb_countries.mbtiles
