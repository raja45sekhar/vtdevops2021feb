###########################################################
# This script will dynamically create the domain as per your inputs
###########################################################
import os
WLHOME=os.environ['WL_HOME']
#==========================================
# Create a domain from the weblogic domain template.
#==========================================
readTemplate(WLHOME+'/common/templates/wls/wls.jar')
cd('Servers/AdminServer')
AdminName=raw_input('Please Enter Admin ServerName: ')
set('Name',AdminName)
#==========================================
# Configure the Administration Server
#==========================================
AdminListenAdr=raw_input('Please Enter Admin Listen Address: ')
AdminListenPort=input('Please enter Admin listen Port: ')
set('ListenAddress',AdminListenAdr)
set('ListenPort', AdminListenPort)
#====================================================
# Define the password for user weblogic. You must define the password before you
# can write the domain.
#====================================================
cd('/')
cd('Security/base_domain/User/weblogic')
usr=raw_input('Please Enter AdminUser Name: ')
set('Name',usr)
AdminPassword=raw_input('Please enter Admin password:')
cmo.setPassword(AdminPassword)
# - OverwriteDomain: Overwrites domain, when saving, if one exists.
setOption('OverwriteDomain', 'true')
#==============================================
# Write the domain, close template and finally exit from the WLST
#==============================================
domainPath=raw_input('Enter the domain path: ')
domainName=raw_input('Enter domain name: ')
print 'Given domain path, name : ', domainPath, domainName
writeDomain(domainPath+"/"+domainName)
closeTemplate()
exit()
#===============================================
