#!/bin/bash
cd $HOME
git clone https://github.com/ozonesecurity/ozonebase.git
cd $HOME/ozonebase
git submodule update --init --recursive
( cd externals/openh264/ && make PREFIX="$INSTALLDIR" install )
( cd externals/ffmpeg && PKG_CONFIG_PATH=$INSTALLDIR/lib/pkgconfig ./configure --enable-shared --enable-libopenh264 --prefix=$INSTALLDIR && make install )
( cd server && cmake -DCMAKE_PREFIX_PATH=$INSTALLDIR -DOZ_EXAMPLES=ON -DCMAKE_INSTALL_PREFIX=$INSTALLDIR -DCMAKE_INSTALL_RPATH=$INSTALLDIR/lib . && make install )
