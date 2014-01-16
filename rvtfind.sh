#!/bin/bash
#Revit Version Extraction script 1.0 PT1
#Finds the *.rvt in central model folder and runs rvreport.sh to extract hex value of revit year version and create CSV reports
##########
#rename the variables below to the share you want to run this script on
##########
share="projects"
##########
find /mnt/$share/??.????.???/BIM/Building\ Model/_Central\ Model\ File/ -maxdepth 1 -iname '*.rvt' -execdir bash ~/rvreport.sh '{}' \;
