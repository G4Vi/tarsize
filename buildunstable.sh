#!/bin/bash
gcc -Wall -fPIC -shared -o tarpart.so tarpart.c -ldl

TS_TAR_START=0 TS_TAR_END=1000000  LD_PRELOAD=./tarpart.so tar -c test 2> unstable1.txt > out1.tar
TS_TAR_START=1000001 TS_TAR_END=2000000  LD_PRELOAD=./tarpart.so tar -c test  2>unstable2.txt > out2.tar
TS_TAR_START=2000001 TS_TAR_END=195819519  LD_PRELOAD=./tarpart.so tar -c test 2>unstable3.txt > out3.tar
cat out1.tar out2.tar out3.tar | sha256sum
tar -c test | sha256sum 
sha256sum out1.tar out2.tar out3.tar 

