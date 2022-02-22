#! /bin/bash
# get the directory where this script is stored
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
export LARSOFT_TESTBED_DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )/../"

INSTALL_DIRECTORY=/dune/app/users/$USER/LArSoftTestbedInstall
LARSOFT_VERSION=v09_31_00
DUNETPC_VERSION=$LARSOFT_VERSION
ARTG4TK_VERSION=v10_03_00
QUALS=e20:prof
GEOMETRY_PATH=$LARSOFT_TESTBED_DIR/geometry/

source /cvmfs/dune.opensciencegrid.org/products/dune/setup_dune.sh
setup larsoft $LARSOFT_VERSION -q $QUALS
setup ninja

cd $INSTALL_DIRECTORY
source localProducts*/setup

cp $GEOMETRY_PATH/geometry_dune.fcl $MRB_INSTALL/dunetpc/$LARSOFT_VERSION/job/

cd $LARSOFT_TESTBED_DIR