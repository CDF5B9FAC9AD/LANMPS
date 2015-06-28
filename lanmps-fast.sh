#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:/root/bin:~/bin
export PATH
IN_PWD=$(pwd)
# Check if user is root
if [ $UID != 0 ]; then echo "Error: You must be root to run the install script, please use root to install lanmps";exit;fi
FAST=1
START="no"
IS_EXISTS_REMOVE=0
IS_DOCKER=1
. $IN_PWD/lib/common.sh

. $IN_PWD/lib/Install_Fast.sh

Init_SetDirectoryAndUser 2>&1 | tee -a "${LOGPATH}/1.Init_SetDirectoryAndUser-install.log"

Init 2>&1 | tee -a "${LOGPATH}/2.Init-install.log"

{ 
 
Init_CheckAndDownloadFiles;

Install_DependsAndOpt;

Install_Fast;

 }  2>&1 | tee -a "${LOGPATH}/3.Install.log"

Starup 2>&1 | tee -a "${LOGPATH}/9.Starup-install.log"

CheckInstall 2>&1 | tee -a "${LOGPATH}/10.CheckInstall-install.log"