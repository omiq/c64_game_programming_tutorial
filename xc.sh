#!/bin/sh
echo "Compiling and running $1.bas"
xcbasic3 $1.bas $1.prg && x64sc $1.prg