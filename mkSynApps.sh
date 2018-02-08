#!/bin/bash

# ###############################################
# Based on Peter Jemian script from  tech-talk
# https://epics.anl.gov/tech-talk/2018/msg00259.php
# ###############################################

#wget https://raw.githubusercontent.com/EPICS-synApps/support/master/assemble_synApps.sh
# edit for local choices
#bash assemble_synApps.sh

# ################################
# assemble_synApps.sh modified to AreaDetector 3.2 onley
# ================================
bash assemble_synAppsAD3_2.sh full
cd synApps/support
sed -i "s/^EPICS_BASE=.*/EPICS_BASE=\/epics\/base-3.15.5/" configure/RELEASE
make release

git clone https://github.com/areaDetector/areaDetector
cd areaDetector
git clone https://github.com/areaDetector/ADCore
git clone https://github.com/areaDetector/ADSupport
git clone https://github.com/areaDetector/ADSimDetector
#git clone https://github.com/areaDetector/ADProsilica
#git clone https://github.com/areaDetector/ADAndor3
git clone https://github.com/areaDetector/ADDexela


# Sort out releases ('git checkout master' for most recent)
git checkout R3-2; 
cd ADCore; git checkout R3-2; cd ..
cd ADSupport; git checkout R1-4; cd ..
cd ADSimDetector; git checkout R2-7; cd ..
#cd ADProsilica; git checkout R2-4; cd ..
#cd ADAndor3; git checkout R2-2; cd ..
#cd ADDexela; git checkout R2-1; cd ..
cd ADDexela; git checkout master; cd ..

# Edit AreaDetector/configure/RELEASE... file system

# ##################################
# Compilation order (areaDetector 3-2)
# Date: 2018-2-7
# ====================================
#seq, ipac, autosave, | caPutLog
#asyn, devIocStats, sscan
#busy, ipUnidac, calc, std
#mca
#areaDetector
#quadEM

# ##################################
# Updating the areaDetector
# =================================
# from directory  /epics/areadetector/
# git pull --recurse-submodules

# #########################3
# Git releases
# =======================
# git tag
# git tag -l R4-3* # Match pattern defined by -l
# git show-ref --tags -d
# ***********************

# ###############################
# AreaDetector recursively cloned
# ===============================
#git clone --recursive https://github.com/areaDetector/areaDetector.git
#git clone https://github.com/epics-modules/quadEM
#cd areaDetector/ADCore; git checkout R3-1; cd ../..
# ... many more modules here

# ##################################
# Updating the areaDetector
# =================================
# from directory  /epics/areadetector/
# git pull --recurse-submodules

# ##################################
# Additional synApps components
# ==================================
##darcs get http://www-csr.bessy.de/control/SoftDist/caPutLog/repo/caPutLog
#wget http://www-csr.bessy.de/control/SoftDist/caPutLog/_downloads/caPutLog-3.6.tar.gz; tar -xvzf caPutLog-3.6.tar.gz
#git clone https://github.com/epics-modules/alive

# ######################################################################
# PCIe EVR on powerBrick v.3.0.1, Biffiger Roger (Roger.Biffiger@psi.ch)
# Requires PCI VME support library devlib2
# =========================================
# git clone https://github.com/pauscherrerinstitute/mrfioc2
# git clone https://github.com/kgofron/devlib2

# ################################################
# medm is now (2017-7-15) on github.com/epics-extensions/medm
# ================================================
#git clone https://github.com/epics-extensions/medm; cd /epics/extensions/src/medm; git checkout MEDM3_1_14; 
#https://github.com/epics-extensions/medm/archive/MEDM3_1_14.tar.gz
# Need msi from https://epics.anl.gov/extensions/msi/
