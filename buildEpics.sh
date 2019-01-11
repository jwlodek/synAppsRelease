#!bin/bash

# THis script will build all of EPICS base and epics synapps required for area detector.
#It can also build area detector if the last commands are uncommented.

cd synApps
mv epics-base-7-0-1-1 ../base-7.0.1
cd support

# This may not be necessary but the make release script expects galil-3-6
mv Galil-3-0 galil-3-6
mv galil-3-6/3-6/* galil-3-6/.

# setting up synapps configuration
make release
cd ../../../base-7.0.1
make -sj

cd ../synAppsRelease/synApps/support

# Build all of the synApps
cd seq-2-2-5
make -sj
cd ../sscan
make -sj
cd ../busy
make -sj
cd ../calc
make -sj
cd ../asyn
make -sj
cd ../busy
make -sj
cd ../alive
make -sj
cd ../iocStats
make -sj

# Uncomment the below commands to build area detector
cd ../areaDetector-3-3-2
cd configure
git clone https://github.com/jwlodek/adConfigSetup
bash scripts/autoSetupAD.sh
