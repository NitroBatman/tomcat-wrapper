#!/bin/bash

LINE=____________________________________________

## CHECK USERS ON MACHINE

users=($(awk -F':' '{ print $1}' /etc/passwd | grep "ytm*"))

## LOOP THROUGH EXISTING LIST OF USERS

for user in "${users[@]}"
do

## CHECKING IF DIRECTORY EXISTS...

  if [ -d "/home/$user/ytm/$res" ];
  then
    echo $LINE
    echo "LOGGED IN AS: $user"
    echo

## CHECKS IF TOMCAT IS RUNNING

   sudo -u $user -H sh -c "bash ./istomcat.sh" | grep 'apache' &> /dev/null
   if [ $? == 0 ]; then
     echo "TOMCAT SERVER IS STILL RUNNING ON THIS INSTANCE"

## IF TOMCAT IS RUNNING THEN SHUT IT DOWN
     echo "Attempting to shutdown tomcat."
     echo
     sudo -u $user -H sh -c "bash ./tstop.sh" &> /dev/null
     if [ $? = 0 ]; then
       echo "Success!"
     else
       echo "FAILED SHUTTING DOWN TOMCAT $user"
       sleep 2
       echo "KILLING PROCESS BRUTALLY."
       sudo -u $user -H sh -c "pkill -9 -f tomcat" &> dev/null
     fi
## START TOMCAT

  else
     echo "CURRENTLY NO TOMCAT SERVER RUNNING ON $user"
     echo
     echo "STARTING TOMCAT FOR INSTANCE: $user"
     echo
     sudo -u $user -H sh -c "bash ./tstart.sh"

  fi

  else

      echo "FAILED: CANNOT START TOMCAT!"
  fi
  echo $LINE
  sleep 4
done
