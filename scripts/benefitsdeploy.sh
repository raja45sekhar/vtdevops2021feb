# This script is to deploy benefits app on admin server
java weblogic.Deployer -adminurl t3://192.168.33.110:8001 \
     -username weblogic -password Welcome1 \
     -deploy /vagrant/data/benefits.war -id benefits

