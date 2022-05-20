#This script will compare the directory and files based on the name parameter and output the difference to a text file.

$Directory1=Get-ChildItem -Recurse -Path "\\path_to_the_first_directory"
$Directory2=Get-ChildItem -Recurse -Path "\\path_to_the_second_directory"

$results=Compare-Object -ReferenceObject $Directory1 -DifferenceObject $Directory2 -Property Name -Passthrough
$results.Fullname|Out-File <\\path_to_output_file\Comparison.txt>
