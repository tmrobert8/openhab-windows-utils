# openHAB Windows Utilities

The windows service utility provides a version agnostic utility that will manage running openHAB as a service (including installation, status, the ability to start/stop and uninstall).

This service utility was built using [WinSW](https://github.com/kohsuke/winsw).  Please review their documentation for complete details.

## How to install

To install the openHAB windows service utility, please follow these steps:

1. Download [openHAB-service.exe](openHAB-service.exe) to your openHAB home directory (usually c:\openhab2)
2. Download [openHAB-service.xml](openHAB-service.xml) to your openHAB home directory. 
3. Modify openHAB-service.xml to reflect your setup (see Configuration Options section below)
4. Open an adminstrative console and change directory to your openAHB home directory. 
5. Execute ```openHAB-service install``` to install the service (see Service Command Line section below)

NOTE: if you use the windows installer, the steps will be done for you.

## Configuration Options

The [openHAB-service.xml](openHAB-service.xml) file specifies the options that the service will use.  You must modify this file to match your local system.

Please note - if you installed into c:\openhab2 (the default directory), you can download [openHAB-service.example.xml](openHAB-service.example.xml), rename it to openHAB-service.xml and use that file unaltered.

Regardless, you can use [openHAB-service.example.xml](openHAB-service.example.xml) as a starting point as well (and for reference)

When you modify this file, you **must** replace the following:

| Parameter          | Descriptino                                                       |
|--------------------|-------------------------------------------------------------------|
| $$SERVICEID        | The identifier for the service (ex: openHAB)                      |
| $$LANG_SERVICENAME | The name of the service (ex: openHAB Service)                     |
| $$LANG_SERVICEDESC | The description of the service (ex: Runs the openHAB system)      |
| $$OPENHAB_RUNTIME  | The location of the runtime directory (ex: c:\openhab2\runtime)   |
| $$OPENHAB_USERDATA | The location of the userdata directory (ex: c:\openhab2\userdata) |
| $$OPENHAB_HOME     | The location of the home directory (ex: c:\openhab2)              |

Please review [WinSW](https://github.com/kohsuke/winsw) for other configuration options (like logging, etc)

## Service Command Line

The following list is a high level summary of options availabe.  To execute an option, open a console to where openHAB-service.exe is located and type: ```openHAB-service.exe (option)```

Where (option) is...

1. ```install``` will install the service
2. ```status``` will return the current status of the service
3. ```start``` will start the openHAB service
4. ```stop``` will stop the openHAB service
5. ```restart``` will restart the openHAB service
6. ```uninstall``` will uninstall the service

Please review [WinSW](https://github.com/kohsuke/winsw) for complete documentation of all options.  

## Developer 

Be careful modifying/committing changes to [openHAB-service.xml](openHAB-service.xml)!  This file is **ALSO** used by the installer to create the service XML on the client.  Any changes to this file will likely need to be reflected in the installer script as well.