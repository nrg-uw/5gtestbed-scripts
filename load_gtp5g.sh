#!/bin/bash
if [ ! -d "gtp5g" ] ; then
    git clone https://github.com/niloysh/gtp5g.git
fi
cd gtp5g
git checkout v0.3.2.1
make clean && make
sudo make install
