#!/bin/bash

set -e

out="./artifacts/RadonIDE"

npm install # Install submodule
rm -rf $out
mkdir -p $out

echo "Building webui"

npm run web:export 
mkdir -p $out/redux-devtools
mv -f dist/_expo/static/css/* $out/redux-devtools/ # Copy newly generated files
mv -f dist/_expo/static/js/web/* $out/redux-devtools/ # Copy newly generated files

echo "Building plugin"

./node_modules/.bin/esbuild src/index.ts --bundle --platform=node --outfile=redux-devtools-expo-dev-plugin.js

mv -f ./redux-devtools-expo-dev-plugin.js $out/redux-devtools-expo-dev-plugin.js

