#!/bin/bash
set -ex

cp -r /dbuilder/sources/. -t /dbuilder/build/
cd /dbuilder/build/

COMMIT_ID=$(git log --pretty=format:'%h' -n 1 || true)

if [ ! -z "$COMMIT_ID" ]; then
    sed -i "s/^#define VERSION.*\"/#define VERSION \"git-$COMMIT_ID\"/" ZodiacFX/src/config/config_zodiac.h
fi

make -C ZodiacFX/

mkdir /dbuilder/sources/build 2>/dev/null || true
cp ZodiacFX/ZodiacFX.elf \
   ZodiacFX/ZodiacFX.bin \
   ZodiacFX/ZodiacFX.lss.gz \
   /dbuilder/sources/build
