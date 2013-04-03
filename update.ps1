$destinationFolder = "packages"
if (!(Test-Path -path $destinationFolder)) {New-Item $destinationFolder -Type Directory}
nuget update packages.config -r packages