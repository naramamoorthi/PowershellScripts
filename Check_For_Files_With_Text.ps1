$Filelist=Get-ChildItem -Path "Path_To_Target_Directory" -Filter <target_filename.extension> -Recurse | %{$_.Fullname}
$results=@()
Foreach ($File in $Filelist)
{
$Target=$Null
$Target=Get-Content $File | Select-String -Pattern <text> -ErrorAction SilentlyContinue
$results=$Target|Add-Member -Name Path -Value $File.Fullname -MemberType
}
