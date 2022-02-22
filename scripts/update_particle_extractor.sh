#! /bin/bash
# get the directory where this script is stored
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
export LARSOFT_TESTBED_DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )/../"
GEOMETRY_PATH=$LARSOFT_TESTBED_DIR/geometry/
source $LARSOFT_TESTBED_DIR/scripts/setup_testbed.sh
mrbslp

cd $MRB_SOURCE/dunetpc/dune/ParticleExtractor
git pull

ninja -C $MRB_BUILDDIR -j 32 install

cp $GEOMETRY_PATH/geometry_dune.fcl $MRB_INSTALL/dunetpc/$LARSOFT_VERSION/job/

cd $LARSOFT_TESTBED_DIR