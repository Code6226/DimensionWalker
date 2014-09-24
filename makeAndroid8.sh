#!/bin/bash
while true
do
    grunt dist
    pushd ~/crosswalk-8.37.189.2/
    python make_apk.py --manifest=/home/code6/Coding/dimensionwalker/dist/manifest8.json --arch=arm --package=com.dimensionwalker.dimensionwalker
    popd

    adb install -r /home/code6/crosswalk-8.37.189.2/DimensionWalker_0.1.0.0_arm.apk

    echo ''
    read -p "Hit enter to build and install DimensionWalker to Android (Debug)"
done

