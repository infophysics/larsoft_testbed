#! /bin/bash
source setup_testbed_directory.sh

INSTALL_DIRECTORY=/dune/app/users/$USER/LArSoftTestbedInstall
LARSOFT_VERSION=v09_31_00
DUNETPC_VERSION=$LARSOFT_VERSION
ARTG4TK_VERSION=v10_03_00
QUALS=e20:prof

source /cvmfs/dune.opensciencegrid.org/products/dune/setup_dune.sh
setup larsoft $LARSOFT_VERSION -q $QUALS
setup ninja

mkdir $INSTALL_DIRECTORY
cd $INSTALL_DIRECTORY

mrb newDev
source localProducts*/setup

cd $MRB_SOURCE
mrb g -t $DUNETPC_VERSION dunetpc

cd $LARSOFT_TESTBED_DIR