# Windows_Security_Audit
Security Audit Script for Windows Servers running Active Directory

The following scripts are designed to complete a standard security questionnaire.  Below are instructions on how to use each module. 

**Security_Audit.ps1**
This script is to be run on a **domain controller** and outputs the bulk of the required information.  The main purpose is for scanning GPOs for keywords that may indicate an existing policy to modify certain security characteristics within the organization.  

This file will output a list of possible GPOs that will need to be manually audited to see if they impact the relevant security settings. 

_Important!!_: At launch, this file will ask if you want to run the script against every domain computer. **Do not** say **yes** to this option if the environment has a lot of domain computers.  This option will significantly increase the time the script takes to run, and may not even produce useful information.  The script will pull a complete list of domain computers from AD, and run each check against all domain computers using remote powershell sessions.  Most of the time, this capability is not enabled and just takes a very long time to produce "could not retrieve information" results. 

_Recommend running script without this functionality first, then deciding if scanning every PC is necessary_

**localadmins.ps1**
This script is designed to be run on every endpoint via **RMM**.  It will output a list of all members of the **Local Admins** group to the directory **C:\Temp\Local_Admins.txt** on every individual endpoint.  This file will need to be pulled manually and merged for auditing purposes.  
