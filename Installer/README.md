# openHAB Windows Installer

The windows installer utility is a native windows setup that help install openHAB (or upgrade of an existing installation) and create an uninstaller.  The installer also provides additional value in creating scheduled tasks (for backup and update) and allow running openHAB as a service (using the service utility below).

## Features

The windows installer provides the following features:
1. Obviously install openHAB on a windows system ;)
2. Create an uninstaller that will allow complete removal of openHAB
3. Uninstall will be listed in add/remove programs
4. Ability to create a scheduled task to automatically update openHAB
5. Ability to create a scheduled task to automatically backup openHAB
6. Ability to create a windows service to run openHAB automatically on startup (using the windows service utility)
7. Ability to upgrade an existing installation (see below)
8. TODO Install optional components (such as NODE-RED rules engine)

Please note that some of these options are not available depending on the version of openHAB selected.  Example: creating an update scheduled task is not available until openAHB 2.3.0.

### Upgrade options

When the installer detects a current installation, the following options can be done:

1. If upgrade.ps1 was detected, the option to update by executing the upgrade.ps1 script instead is offered.  If chosen, the rest of the install will be skipped.
2. If an uninstaller was detected, the option to run then uninstaller PRIOR to installation is offered.
3. If an uninstaller was not detected, the option to delete the prior installation is offered.
4. Finally, do nothing is a valid option (in case you are installing into a different directory).

## Developer Information

The following sections are meant for developers that wish to modify the installer.

### openHAB Versions

Each openHAB version the installer can install should be listed in [openHAB-versions.txt][openHAB-versions.txt].  The openHAB version in the file should be formatted like:

```version=description```

Example:
```
2.4.0-SNAPSHOT=openHAB 2.4 SNAPSHOT
2.4.0=openHAB 2.4 Stable
```

The version should be the actual openHAB version that is reflected in the download URLs (on bintray and ci.openhab.org).  The description is what would be presented to the user.

Please note that this file is ONLY read at compile time and changes will not be interactively updated.

### Language support

The script should support multiple languages.  Steps to add a new language:

1. Add a new defined for the langauge using the windows locale code: ```!defined LANG_GERMAN 1031```
2. Duplicate all the ```LangString``` settings, set the language to your new define and modify the langauge text.
3. Add a new MUI language macro (review MUI documentation on how to add a new langauge if the language has not already been added): ```!insertmacro MUI_LANGUAGE "German"```
4. Create a new license file with the windows locale language code extension: ```openHAB-license-DE.txt"```
5. Recompile the installer

### Compiling the Installer

The installer is built using the [NSIS: Nullsoft Scriptable Install System](https://sourceforge.net/projects/nsis/) system.  The main install script can be found in [openHAB.nsi](openHAB.nsi), the NSIS headers found in the [Include](Include) directory and all plugins can be found in [Plugins](Plugins) directory.  

Please follow these steps to compile the installer:

1. Download and install [NSIS](https://sourceforge.net/projects/nsis/)
2. Clone this repository
3. Open a command line and change directory to the "Installer" directory of the repository
4. Compile the script via 
``` "c:\Program Files (x86)\NSIS\Bin\makensis.exe" openhab.nsi ``` (correcting to the path to makensis on your system)
5. The resulting ```openHAB-setup.exe``` will be found in the Output directory.