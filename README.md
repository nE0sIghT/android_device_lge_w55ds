LineageOS device configuration for LG L65 Dual

Set working directory:
-------------

    mkdir ~/LineageOS && cd ~/LineageOS

How to build:
-------------

Initialize repo:

    repo init -u git://github.com/LineageOS/android.git -b cm-14.1

    curl --create-dirs -L -o .repo/local_manifests/local_manifest.xml -O -L https://raw.githubusercontent.com/nE0sIghT/android_local_manifests/cm-14.1/04-lg-w55ds.xml
    repo sync

Extract proprietary blobs:

    device/lge/msm8226-common/extract-files.sh
    device/lge/w55ds/extract-files.sh

Compile:

    source build/envsetup.sh
    lunch lineage_w55ds-userdebug
    brunch w55ds
