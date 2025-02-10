#!/bin/bash

set -e

out="./artifacts/RadonIDE"

npm install # Install submodule
rm -rf $out
mkdir -p $out

echo "Building webui"

npm run web:export 
mkdir -p $out/webui
mv -f dist/_expo/static/css/* $out/webui/ # Copy newly generated files
mv -f dist/_expo/static/js/web/* $out/webui/ # Copy newly generated files

echo "Building plugin"

./node_modules/.bin/esbuild src/index.ts --bundle --platform=node --outfile=redux-devtools-expo-dev-plugin.js

mkdir -p $out/external
mv -f ./redux-devtools-expo-dev-plugin.js $out/external/redux-devtools-expo-dev-plugin.js
