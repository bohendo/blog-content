#!/bin/bash

if [[ ! $(command -v inkscape) ]]
then echo "Install inkscape first" && exit 1
fi
if [[ ! $(command -v convert) ]]
then echo "Install imgagemagick first" && exit 1
fi

svg=$1
if [[ "$svg" != *.svg ]]
then echo "Expected a path to a .svg file as the first and only arg" && exit 1
fi

tmp=/tmp
base=$(basename "$svg" .svg)
sizes=(16 24 32 48 64 96 128)

for size in "${sizes[@]}"
do
  name="$tmp/${base}${size}.png"
  if [[ -f "$name" ]]
  then rm -f "$name"
  fi
  echo "Creating $name"
  inkscape -w "$size" -h "$size" -e "$name" "$svg"
  echo
done

args=""
for size in "${sizes[@]}"
do args="$args $tmp/${base}${size}.png"
done

if [[ -f "${base}.ico" ]]
then rm -rf "${base}.ico"
fi
echo "convert$args ${base}.ico"

# We want these args to be expanded into multiple arguments
# shellcheck disable=SC2086
convert$args "${base}.ico"
