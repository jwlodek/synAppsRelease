#!/bin/bash

# Building areaDetector from source
# http://www.smolloy.com/2017/10/build-areadetector-for-epics-from-source/

# System Libraries
#sudo apt install re2c xml2 libxml2 git zlib1g-dev libnetcdf-dev libxml2-dev

# *******************************
# Create synApps support infrastructure
supportDir=support5b
supportPath='\/epics\/test\/testGit\/'$supportDir
# Do not overwrite existing directory
if [ -d $supportDir ]
then
    echo "$supportDir exists"
    exit
fi
#mkdir $supportDir
git clone https://github.com/EPICS-synApps/support $supportDir
cd $supportDir
git clone https://github.com/EPICS-synApps/configure
# Edit configure/RELEAES and choose versions
# ==========================================
cp configure/RELEASE configure/RELEASE.BKP
sed -i "s/^SUPPORT=.*/SUPPORT=\/epics\/test\/testGit\/$supportDir/" configure/RELEASE
sed -i "s/^EPICS_BASE=.*/EPICS_BASE=\/epics\/base-3.15.5/" configure/RELEASE
#sed -i "s/^ASYN=.*/ASYN=\/epics\/$supportDir\/asyn/" configure/RELEASE
#sed -i "s/^AUTOSAVE=.*/AUTOSAVE=\/epics\/$supportDir\/autosave/" configure/RELEASE
#sed -i "s/^BUSY=.*/BUSY=\/epics\/$supportDir\/busy/" configure/RELEASE
#sed -i "s/^SNCSEQ=.*/SNCSEQ=\/epics\/$supportDir\/seq-2.2.5/" configure/RELEASE
#sed -i "s/^SSCAN=.*/SSCAN=\/epics\/$supportDir\/ssscan/" configure/RELEASE
#sed -i "s/^CALC=.*/CALC=\/epics\/$supportDir\/calc/" configure/RELEASE
#sed -i "s/^DEVIOCSTATS=.*/CALC=\/epics\/$supportDir\/iocStats/" configure/RELEASE

sed -i "s/^ASYN=.*/ASYN=$supportPath\/asyn/" configure/RELEASE
sed -i "s/^AUTOSAVE=.*/AUTOSAVE=$supportPath\/autosave/" configure/RELEASE
sed -i "s/^BUSY=.*/BUSY=$supportPath\/busy/" configure/RELEASE
sed -i "s/^SNCSEQ=.*/SNCSEQ=$supportPath\/seq-2.2.5/" configure/RELEASE
sed -i "s/^SSCAN=.*/SSCAN=$supportPath\/sscan/" configure/RELEASE
sed -i "s/^CALC=.*/CALC=$supportPath\/calc/" configure/RELEASE
sed -i "s/^DEVIOCSTATS=.*/DEVIOCSTATS=$supportPath\/iocStats/" configure/RELEASE

# ********************************
#EPICS depencencies
#asyn
#autosave
#busy
#seq
#sscan
#calc
#devIocStats
# 
git clone https://github.com/epics-modules/asyn
git clone https://github.com/epics-modules/autosave
git clone https://github.com/epics-modules/busy
git clone https://github.com/epics-modules/sscan
git clone https://github.com/epics-modules/calc
git clone https://github.com/epics-modules/iocStats
wget http://www-csr.bessy.de/control/SoftDist/sequencer/releases/seq-2.2.5.tar.gz
tar -xvzf seq-2.2.5.tar.gz
git clone https://github.com/epics-modules/alive
#darcs get http://www-csr.bessy.de/control/SoftDist/caPutLog/repo/caPutLog
wget http://www-csr.bessy.de/control/SoftDist/caPutLog/_downloads/caPutLog-3.6.tar.gz
tar -xvzf caPutLog-3.6.tar.gz
git clone https://github.com/epics-modules/mca


# Sort out releases ('git checkout master' for most recent)
cd asyn; git checkout R4-32; cd ..
cd autosave; git checkout R5-9; cd ..
cd busy; git checkout R1-7; cd ..
cd sscan; git checkout R2-11; cd ..
cd calc; git checkout R3-7; cd ..
cd alive; git checkout R1-0-1; cd ..
cd mca; git checkout R7-7; cd ..

# AreaDetector 
#git clone --recursive https://github.com/areaDetector/areaDetector.git
#git clone https://github.com/epics-modules/quadEM
#cd areaDetector/ADCore
#git checkout R3-1
#cd ../..
# ... many more modules here

# Continue with support/configure
# at top of the support issue 'make release', which will sync the RELEASE for all files,
# including areaDetector


# Updating the areaDetector
# =================================
# from directory  /epics/areadetector/
# git pull --recurse-submodules


# ***********************
# Git releases
# git tag
# git tag -l R4-3* # Match pattern defined by -l
# git show-ref --tags -d
# ***********************

#=============================================
# Creating areaDetector one module at a time
#git clone https://github.com/areaDetector/areaDetector
#sleep 1
#cd areaDetector
#git clone https://github.com/areaDetector/ADCore
#git clone https://github.com/areaDetector/ADMerlin
#git clone https://github.com/areaDetector/ADPCO
#git clone https://github.com/areaDetector/ADCameralink
#git clone https://github.com/areaDetector/ADPilatus
#git clone https://github.com/areaDetector/ADExample
#git clone https://github.com/areaDetector/ADSupport
#git clone https://github.com/areaDetector/ADProsilica
#git clone https://github.com/areaDetector/ADMythen
#git clone https://github.com/areaDetector/ADPixirad
#git clone https://github.com/areaDetector/aravisGigE
#git clone https://github.com/areaDetector/ADFastCCD
#git clone https://github.com/areaDetector/ADBinaries
#git clone https://github.com/areaDetector/ADAndor
#git clone https://github.com/areaDetector/ADPointGrey
#git clone https://github.com/areaDetector/ffmpegServer

#git clone https://github.com/areaDetector/ADSBIG
#git clone https://github.com/areaDetector/ADnED

#git clone https://github.com/areaDetector/ADLambda
#git clone https://github.com/areaDetector/ADPerkinElmer
#git clone https://github.com/areaDetector/ADPICam
#git clone https://github.com/areaDetector/ADmarCCD
#git clone https://github.com/areaDetector/ADmar345
#git clone https://github.com/areaDetector/ADURL
#git clone https://github.com/areaDetector/ADRoper
#git clone https://github.com/areaDetector/ADQImaging
#git clone https://github.com/areaDetector/ADPvCam
#git clone https://github.com/areaDetector/ADPSL
#git clone https://github.com/areaDetector/ADFireWireWin
#git clone https://github.com/areaDetector/ADDexela
#git clone https://github.com/areaDetector/ADAndor3
#git clone https://github.com/areaDetector/ADBruker
#git clone https://github.com/areaDetector/ADADSC
#git clone https://github.com/areaDetector/ADLightField
#git clone https://github.com/areaDetector/firewireDCAM
#git clone https://github.com/areaDetector/ADPluginEdge
#git clone https://github.com/areaDetector/ffmpegViewer

# PCIe EVR on powerBrick v.3.0.1, Biffiger Roger (Roger.Biffiger@psi.ch)
# Requires PCI VME support library devlib2
# git clone https://github.com/pauscherrerinstitute/mrfioc2
#git clone https://github.com/kgofron/mrfioc2
# git clone https://github.com/kgofron/devlib2
#git clone https://github.com/epics-modules/devlib2

# medm is now (2017-7-15) on github.com/epics-extensions/medm
#git clone https://github.com/epics-extensions/medm
#https://github.com/epics-extensions/medm/archive/MEDM3_1_14.tar.gz



