#! /bin/bash
source setup_testbed.sh

cd $MRB_SOURCE/dunetpc/dune/

git clone https://github.com/UC-Davis-Machine-Learning/ParticleExtractor.git

sed -i '$ a add_subdirectory(ParticleExtractor)' CMakeLists.txt

cd $MRB_BUILDDIR
mrbsetenv
mrb install -j 32 --generator ninja

cd $LARSOFT_TESTBED_DIR
