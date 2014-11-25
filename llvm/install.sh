#!/bin/bash

sudo cp ./llvm.list /etc/apt/sources.list.d
wget -O - http://llvm.org/apt/llvm-snapshot.gpg.key|sudo apt-key add -
sudo apt-get update
sudo apt-get install clang-3.5 clang-3.5-doc lldb-3.5 clang-format-3.5
