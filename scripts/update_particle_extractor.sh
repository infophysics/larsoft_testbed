#! /bin/bash
source setup_testbed.sh
mrbslp

cd $MRB_SOURCE/dunetpc/dune/ParticleExtractor
git pull

ninja -C $MRB_BUILDDIR -j 32 install

cd $LARSOFT_TESTBED_DIR