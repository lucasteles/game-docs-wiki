#!/usr/bin/env bash

GAME_NAME="Docs Template Mugen"
DEFAULT_PASSWORD=Password@Secret!123
DEFAULT_SALT=12345678901234567890123456789012
DEFAULT_REMEMBER=30

TMP_DIR=_site_tmp
OUT_DIR=_site

export STATICRYPT_PASSWORD="${STATICRYPT_PASSWORD:-$DEFAULT_PASSWORD}"
export STATICRYPT_SALT="${STATICRYPT_SALT:-$DEFAULT_SALT}"
export STATICRYPT_REMEMBER="${STATICRYPT_REMEMBER:-$DEFAULT_REMEMBER}"

echo "- Installing DocFx"
dotnet tool install -g docfx

echo "- Building Docs"
docfx --output $TMP_DIR

echo "- Encrypting Pages"

# Broken because: https://github.com/robinmoisson/staticrypt/issues/212
# npx --yes staticrypt \

npm install
npm start -- \
        $TMP_DIR/* \
        --salt $STATICRYPT_SALT \
        --recursive \
        --config false --short \
        --directory $OUT_DIR \
        --remember $STATICRYPT_REMEMBER \
        --template ./password_template.html \
        --template-color-primary "#323a42" \
        --template-color-secondary "#343a40" \
        --template-title "$GAME_NAME - Wiki" \
        --template-button "ENTER" \
        --template-instructions 'Need a password? <a href="https://linktr.ee/lucasteles42" target="_blank">reach me out</a>'

echo "- Cleaning Temp Files"
rm -rf ./$TMP_DIR

echo "- Done!"
