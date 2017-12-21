#!/bin/bash

YTM_USER=$(whoami)


TOMCAT_DIR=/home/${YTM_USER}/ytm/res/ProgramFiles/tomcat/apache-tomcat-7.0.34-64bit
TOMCAT_CONFIG_DIR=/home/${YTM_USER}/ytm/res/ProgramFiles/tomcat/config

echo $TOMCAT_DIR
if [ -d $TOMCAT_DIR ];
then
 cd ${TOMCAT_DIR}/bin; ./startup.sh -config ${TOMCAT_CONFIG_DIR}/deployment/server_${YTM_USER}.xml
 echo "Tomcat started."
else
 echo "ERROR: TOMCAT DIRECTORY DOES NOT EXIST!"
fi
