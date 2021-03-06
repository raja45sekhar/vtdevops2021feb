#!/bin/bash
#vignesh - Deploy application admin server
file="./parameters.properties"

if [ -f "$file" ]
then
    echo "$file found."
 . $file
java weblogic.Deployer -adminurl $adminurl \
     -username $username -password $pwd \
     -deploy $apppath/$app 

else
    echo "$file not found."
fi
