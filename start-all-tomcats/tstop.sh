#!/bin/bash

YTM_USER=$(whoami)


## TOMCAT CONFIG DIRECTORIES

TOMCAT_DIR=/home/${YTM_USER}/ytm/res/ProgramFiles/tomcat/apache-tomcat-7.0.34-64bit
TOMCAT_CONFIG_DIR=/home/${YTM_USER}/ytm/res/ProgramFiles/tomcat/config

## SHUTING DOWN TOMCAT

if [ -d $TOMCAT_DIR ];
then
  "cd ${TOMCAT_DIR}/bin; ./shutdown.sh -config ${TOMCAT_CONFIG_DIR}/deployment/server_${YTM_USER}.xml"
else
  echo "ERROR: TOMCAT DIRECTORY NOT FOUND!"
fi
