$destinationFolder = "packages"
if ((Test-Path -path $destinationFolder))
{
 Remove-Item -Path $destinationFolder -Recurse
}

 New-Item $destinationFolder -Type Directory
  nuget install packages.config -o $destinationFolder

nuget update packages.config -r $destinationFolder
Remove-Item $destinationFolder -Force -Recurse
nuget install packages.config -o $destinationFolder -ExcludeVersion