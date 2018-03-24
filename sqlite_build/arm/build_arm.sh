#!/bin/sh 

#配置编译选项
PWD=`pwd`
echo "pwd=$PWD"
../../sqlite_src/configure CC=arm-linux-gnueabihf-gcc --host=arm-linux-gnueabihf --prefix=${PWD}/target

make
make install

cd target/bin
arm-linux-gnueabihf-strip *
cd ../lib
arm-linux-gnueabihf-strip *

#打包文件
cd ../../ 
tar -cjf sqlite_arm.tar.bz2 target

