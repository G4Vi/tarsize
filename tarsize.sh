#!/bin/bash
LD_PRELOAD=./tarsize.so  tar "$@"

