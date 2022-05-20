#This script/command will rename files in the target directory, replacing the characters defined.
ls|Rename-Item -NewName {$_.Name -replace "Old_Characters","New_Characters"}

#Example: ls|Rename-Item -NewName {$_.Name -replace "DHCP","Dynamic_Host_Configuration_Protocol"}
#In the example above, the term "DHCP" in the filenames will be replaced with "Dynamic_Host_Configuration_Protocol", so a file called "DHCP_Main_DC.txt" will become "Dynamic_Host_Configuration_Protocol_Main_DC.txt"
