$destinationFolder = "packages"
if (!(Test-Path -path $destinationFolder))
{
  New-Item $destinationFolder -Type Directory
  nuget install packages.config -o $destinationFolder
}

nuget update packages.config -r $destinationFolder
rd packages -Force -Recurse
nuget install packages.config -o $destinationFolder