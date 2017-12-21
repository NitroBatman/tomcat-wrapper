#!/bin/bash

YTM_USER=$(whoami)

#CHECKS IF TOMCAT PROCCESS EXISTS
TEMP="$(ps -ef | grep -w $YTM_USER | grep apache | grep -v grep)"

echo $TEMP
