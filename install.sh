#!/bin/sh

# This is base install script that calls other hierarchicaly lower install
# scripts.

(cd bash && ./install.sh)
(cd git && ./install.sh)
(cd vim && ./install.sh)
