#!/bin/bash

# Stupid shell script to compile kernel, nothing fancy
ID="`pwd`"

# Exports all the needed things Arch, SubArch and Cross Compile
export ARCH=arm
echo 'exporting Arch'
export SUBARCH=arm
echo 'exporting SubArch'

# Export toolchain based on where I'm compiling
    export CROSS_COMPILE=/home/prbassplayer/mm6.0-staging/prebuilts/gcc/linux-x86/arm/arm-eabi-4.8/bin/arm-eabi-
    echo 'exporting Cross Compile server'

# Make sure build is clean!
echo 'Cleaning build'
make clean

# Generates a new .config and exists
if [ "$1" = "config" ] ; then
    echo 'Making defconfig for flo'
    make slim_flo_defconfig
    exit
fi

# Exports kernel local version? Not sure yet.
#echo 'Exporting kernel version'
#export LOCALVERSION='SlimTest_1.0'

# Lets go!
echo 'Lets start!'
make -j$1
