Nuget Standalone
=============
This little sample shows how to use `Nuget.exe` to install packages and update them, without having a Visual C#/Basic/F# project. In particular, in this sample I download NUnit 2.6.1 then I update it (to at least version 2.6.2), making sure that in the end I have in the project folder only the latest version.

1. Download `Nuget.exe` from http://nuget.codeplex.com/releases/view/58939
2. Make sure that `Nuget.exe` is in the repo folder or in the PATH
3. open a Powershell prompt
4. invoke `install.ps1` or `install_without_version.ps1` (more on this later). NUnit will be installed and updated in the `packages` folder



Quick explanation for `install.ps1`
------------------
This script install the packages following the default behaviour that Nuget has in Visual Studio -- the dlls are kept in folders whose name contains the version of the assembly.

The installation works out of the box, just by having the `packages.config` file -- `nuget install`will download the library version specified in it.

The update is a little tricky -- we have to let `Nuget` think that it is updating a project, otherwise the update will not start. To achieve this, we insert an empty `csproj` file.

Finally, to have a clean `packages` folder (with only the latest version of NUnit) I simply delete the folder and repeat the installation -- the update has changed `packages.config` to point to the latest version of the library, so the install will grab it directly (copying it from local and not downloading it again).

Quick explanation for `install_without_version.ps1`
------------------
For little projects it is annoying to have the version number in the folder that contains the assembly -- at every update we should update the build file with the new folder.

I discovered in [this post](http://aspiringcraftsman.com/2012/03/09/dependency-management-in-net-offline-dependencies-with-nuget-command-line-tool/) that `Nuget.exe install` has an `-ExcludeVersion` parameter that "deletes" the version name from the folder path.

So, with regard with `install.ps1`, `install_without_version.ps1` has the following changes:

 * it always removes the `packages` folder at the beginning;
 * it does as before an install/update cycle to get latest versions -- this seems to work only if `Nuget.exe install` is done without `-ExcludeVersion`;
 * it then deletes the `packages` folder and do `Nuget.exe install -ExcludeVersion`.