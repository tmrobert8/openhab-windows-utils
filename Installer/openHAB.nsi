; -------------------------------------------------------------------------------
; Includes
; -------------------------------------------------------------------------------
!include "FileFunc.nsh"
!include "LogicLib.nsh"
!include "MUI2.nsh"
!include "nsDialogs.nsh"
!include "StrFunc.nsh"
!include "TextFunc.nsh"
!include "WinCore.nsh" ; MAKELONG
!include "winMessages.nsh"
!include "WordFunc.nsh"

!include ".\Include\JavaVersion.nsh"
!include ".\Include\MoveFileFolder.nsh"
!include ".\Include\Locate.nsh"
!include ".\Include\zipdll.nsh"

!addplugindir ".\Plugins"

; -------------------------------------------------------------------------------
; Supports
; -------------------------------------------------------------------------------
${StrRep}
${StrLoc}
${StrTrimNewLines}
${UnStrTrimNewLines}
${StrTok}

; -------------------------------------------------------------------------------
; Languages
; -------------------------------------------------------------------------------
!define LANG_ENGLISH 1033
LangString LangBrandingText ${LANG_ENGLISH} "openHAB Installer 1.0 (Beta)"
LangString LangBrowse ${LANG_ENGLISH} "Browse"
LangString LangBrowseDirectory1 ${LANG_ENGLISH} "Please select the location for openHAB"
LangString LangBrowseDirectory2 ${LANG_ENGLISH} "to be installed"
LangString LangBrowseDirectoryExists1 ${LANG_ENGLISH} "The following directories already exist and the contents will be deleted if you continue:"
LangString LangBrowseDirectoryExists2 ${LANG_ENGLISH} "Do you want to continue the installation?"
LangString LangFrequency1 ${LANG_ENGLISH} "Please select the"
LangString LangFrequency2 ${LANG_ENGLISH} "frequency"

LangString LangDaily ${LANG_ENGLISH} "Daily"
LangString LangWeekly ${LANG_ENGLISH} "Weekly"
LangString LangMonthly ${LANG_ENGLISH} "Monthly"

LangString LangDaySun ${LANG_ENGLISH} "Sun"
LangString LangDayMon ${LANG_ENGLISH} "Mon"
LangString LangDayTue ${LANG_ENGLISH} "Tue"
LangString LangDayWed ${LANG_ENGLISH} "Wed"
LangString LangDayThu ${LANG_ENGLISH} "Thu"
LangString LangDayFri ${LANG_ENGLISH} "Fri"
LangString LangDaySat ${LANG_ENGLISH} "Sat"

LangString LangTime ${LANG_ENGLISH} "time"
LangString LangTimeMidnight ${LANG_ENGLISH} "midnight"
LangString LangTimeAM ${LANG_ENGLISH} "AM"
LangString LangTimePM ${LANG_ENGLISH} "PM"
LangString LangTimeAMPM ${LANG_ENGLISH} "AM/PM"

LangString LangDayAtBeginningOfMonth ${LANG_ENGLISH} "at the beginning of the month"
LangString LangDayAtEndOfMonth ${LANG_ENGLISH} "at the end of the month"
LangString LangDayOnSpecificDay ${LANG_ENGLISH} "on a specific day"

LangString LangDailyScheduleTitle ${LANG_ENGLISH} "Please select how often to run the daily schedule"
LangString LangDailyScheduleRecur1 ${LANG_ENGLISH} "Recur every"
LangString LangDailyScheduleRecur2 ${LANG_ENGLISH} "day(s)"

LangString LangLogDeleteExistingEnvironmentVariables ${LANG_ENGLISH} "Deleting existing environment variables"
LangString LangLogDeleteScheduleTask1 ${LANG_ENGLISH} "Deleting current"
LangString LangLogDeleteScheduleTask2 ${LANG_ENGLISH} "scheduled task"
LangString LangLogCheckJava ${LANG_ENGLISH} "Checking to see if Java 1.8+ is installed"
LangString LangLogJavaFailed ${LANG_ENGLISH} "openHAB requires Java 1.8+ - which is not installed.  Please download and install the Java 8 version of the JVM"
LangString LangLogDownloading1 ${LANG_ENGLISH} "Downloading the distribution from"
LangString LangLogDownloading2 ${LANG_ENGLISH} "to"
LangString LangLogDownloadingAborted ${LANG_ENGLISH} "The download was aborted:"
LangString LangLogDownloadingAddons1 ${LANG_ENGLISH} "Downloading the addons from"
LangString LangLogDownloadingAddons2 ${LANG_ENGLISH} "to"
LangString LangLogDownloadingAddonsAborted ${LANG_ENGLISH} "The download was aborted:"
LangString LangLogDownloadingLegacyAddons1 ${LANG_ENGLISH} "Downloading the legacy addons from"
LangString LangLogDownloadingLegacyAddons2 ${LANG_ENGLISH} "to"
LangString LangLogDownloadingLegacyAddonsAborted ${LANG_ENGLISH} "The download was aborted:"
LangString LangLogExpandingDistribution1 ${LANG_ENGLISH} "Unzipping"
LangString LangLogExpandingDistribution2 ${LANG_ENGLISH} "to"
LangString LangLogExpandingDistributionAborted ${LANG_ENGLISH} "Could not unzip the distribution file:"
LangString LangLogMoving1 ${LANG_ENGLISH} "Moving"
LangString LangLogMoving2 ${LANG_ENGLISH} "from"
LangString LangLogMoving3 ${LANG_ENGLISH} "to"
LangString LangLogCreateBackupDirectory ${LANG_ENGLISH} "Creating backups directory"
LangString LangLogDefiningEnvironmentVariable1 ${LANG_ENGLISH} "Defining the"
LangString LangLogDefiningEnvironmentVariable2 ${LANG_ENGLISH} "environment variable"
LangString LangLogCouldNotDefineEnvironmentVariable1 ${LANG_ENGLISH} "Could not define"
LangString LangLogCouldNotDefineEnvironmentVariable2 ${LANG_ENGLISH} "environment variable:"
LangString LangLogCheckingJavaHome1 ${LANG_ENGLISH} "Checking to see if"
LangString LangLogCheckingJavaHome2 ${LANG_ENGLISH} "has been defined"
LangString LangLogReinstallJava1 ${LANG_ENGLISH} "Cannot get the current"
LangString LangLogReinstallJava2 ${LANG_ENGLISH} "path - please reinstall java"
LangString LangLogDefiningJavaHome ${LANG_ENGLISH} "Defining"
LangString LangLogCouldNotDefineJavaHome1 ${LANG_ENGLISH} "Could not defined"
LangString LangLogCouldNotDefineJavaHome2 ${LANG_ENGLISH} "environment variable:"
LangString LangLogCheckingService ${LANG_ENGLISH} "Checking if openHAB service (any other openHAB process) is running"
LangString LangLogCreateService ${LANG_ENGLISH} "Creating openHAB service"
LangString LangLogSuccessfullyInstalled ${LANG_ENGLISH} "openHAB was successfully installed!"
LangString LangLogUninstallingTasks ${LANG_ENGLISH} "Uninstalling backup/update tasks (if defined)"
LangString LangLogDeletingEnvironmentVariables ${LANG_ENGLISH} "Deleting associated environment variables"
LangString LangLogRemovingDirectories ${LANG_ENGLISH} "Removing openHAB directories"
LangString LangLogDeleteBackups ${LANG_ENGLISH} "Deleting all backup files"
LangString LangLogDeleteSetupInfo ${LANG_ENGLISH} "Deleting setup information"
LangString LangLogSuccessfullyUninstalled ${LANG_ENGLISH} "openHAB was successfully uninstalled"
LangString LangLogCallingUpdate ${LANG_ENGLISH} "Calling update.ps1 and waiting to finish"
LangString LangLogCallingUpdateDone ${LANG_ENGLISH} "Installation cancelled due to calling update.ps1"
LangString LangLogCallingUninstaller ${LANG_ENGLISH} "Uninstalling old version via uninstaller"

LangString LangSelectDirectoriesHeader1 ${LANG_ENGLISH} "Choose Install Location"
LangString LangSelectDirectoriesHeader2 ${LANG_ENGLISH} "Choose the folder in which to install openHAB."
LangString LangSelectDirectoriesDesc ${LANG_ENGLISH} "To install in a different folder, click Browse and select another folder.  Press the advanced checkbox to customize the installation folders." 
LangString LangSelectDirectoriesAdvanced ${LANG_ENGLISH} "Advanced"
LangString LangSelectDirectoriesAddons ${LANG_ENGLISH} "Addons"
LangString LangSelectDirectoriesBackups ${LANG_ENGLISH} "Backups"
LangString LangSelectDirectoriesConf ${LANG_ENGLISH} "Conf"
LangString LangSelectDirectoriesHome ${LANG_ENGLISH} "Home"
LangString LangSelectDirectoriesUserData ${LANG_ENGLISH} "UserData"
LangString LangSelectDirectoriesRuntime ${LANG_ENGLISH} "Runtime"

LangString LangUpgradeOptionsHeader1 ${LANG_ENGLISH} "Choose Upgrade Options"
LangString LangUpgradeOptionsHeader2 ${LANG_ENGLISH} "An existing openHAB installation was found.  Please choose your upgrade options."
LangString LangUpgradeOptionsDesc1 ${LANG_ENGLISH} "openHAB version"
LangString LangUpgradeOptionsDesc2 ${LANG_ENGLISH} "was found.  Please specify how to upgrade:"
LangString LangUpgradeOptionsUpgdate ${LANG_ENGLISH} "Run update.ps1 from OPENHAB_RUNTIME to update your distribution instead of installing."
LangString LangUpgradeOptionsUninstall ${LANG_ENGLISH} "Run the uninstaller to uninstall the prior version before reinstalling."
LangString LangUpgradeOptionsDelete ${LANG_ENGLISH} "Delete the prior version (losing any custom settings) before installing."
LangString LangUpgradeOptionsDoNothing ${LANG_ENGLISH} "Do nothing and continue to install options."

LangString LangComponentsHeader1 ${LANG_ENGLISH} "Choose Components to install"
LangString LangComponentsHeader2 ${LANG_ENGLISH} "Choose the openHAB installation that you wish to install"
LangString LangComponentsDesc ${LANG_ENGLISH} "Select the openHAB Version to install"
LangString LangComponentsComponent ${LANG_ENGLISH} "Component"
LangString LangComponentsOptional ${LANG_ENGLISH} "Optional Components to include*"
LangString LangComponentsAddons ${LANG_ENGLISH} "Install openHAB Stable Addons"
LangString LangComponentsLegacyAddons ${LANG_ENGLISH} "Install openHAB Stable Legacy Addons"
LangString LangComponentsOptionalExpl ${LANG_ENGLISH} "* You don't need the add-ons archives if your machine has Internet access, openHAB will download add-ons you need online as necessary."

LangString LangScheduleTaskMoreOptions ${LANG_ENGLISH} "More options on the next page ..."

LangString LangBackupHeader1 ${LANG_ENGLISH} "Create a scheduled backup"
LangString LangBackupHeader2 ${LANG_ENGLISH} "Choose whether to schedule a backup of openHAB settings"
LangString LangBackupDesc ${LANG_ENGLISH} "Create a backup schedule"
LangString LangBackupMax ${LANG_ENGLISH} "Maximum # of backups (0 for unlimited)"
LangString LangBackupSelect ${LANG_ENGLISH} "Select the time that you wish to start the backup"

LangString LangBackupDailyHeader1 ${LANG_ENGLISH} "Daily backup options"
LangString LangBackupDailyHeader2 ${LANG_ENGLISH} "Please specify the options for the daily backup"

LangString LangBackupWeeklyHeader1 ${LANG_ENGLISH} "Weekly backup options"
LangString LangBackupWeeklyHeader2 ${LANG_ENGLISH} "Please specify the options for the weekly backup"
LangString LangBackupWeeklySelect ${LANG_ENGLISH} "Select the day you wish the backup to occur"

LangString LangBackupMonthlyHeader1 ${LANG_ENGLISH} "Monthly backup options"
LangString LangBackupMonthlyHeader2 ${LANG_ENGLISH} "Please specify the options for the monthly backup"
LangString LangBackupMonthlySelect ${LANG_ENGLISH} "Select the day you wish the backup to occur"

LangString LangUpdateHeader1 ${LANG_ENGLISH} "Create a scheduled update"
LangString LangUpdateHeader2 ${LANG_ENGLISH} "Choose whether to schedule a update of the openHAB system"
LangString LangUpdateDesc ${LANG_ENGLISH} "Create a update schedule"
LangString LangUpdateStable ${LANG_ENGLISH} "Scheduling the update job will check (and install) the next minor version of openHAB (such as going from 2.4.0 to 2.5.0)"
LangString LangUpdateSnapshot ${LANG_ENGLISH} "Scheduling the update job will check (and install) the latest SNAPSHOT of openHAB"
LangString LangUpdateTime ${LANG_ENGLISH} "Select the time that you wish to start the update"

LangString LangUpdateDailyHeader1 ${LANG_ENGLISH} "Daily update options"
LangString LangUpdateDailyHeader2 ${LANG_ENGLISH} "Please specify the options for the daily update"

LangString LangUpdateWeeklyHeader1 ${LANG_ENGLISH} "Weekly update options"
LangString LangUpdateWeeklyHeader2 ${LANG_ENGLISH} "Please specify the options for the weekly update"
LangString LangUpdateWeeklySelect ${LANG_ENGLISH} "Select the day you wish the update to occur"

LangString LangUpdateMonthlyHeader1 ${LANG_ENGLISH} "Monthly update options"
LangString LangUpdateMonthlyHeader2 ${LANG_ENGLISH} "Please specify the options for the monthly update"
LangString LangUpdateMonthlySelect ${LANG_ENGLISH} "Select the day you wish the update to occur"

LangString LangServiceHeader1 ${LANG_ENGLISH} "Create openHAB service"
LangString LangServiceHeader2 ${LANG_ENGLISH} "Please specify openHAB service options"
LangString LangServiceDesc ${LANG_ENGLISH} "Create an openHAB service to run openHAB automatically at startup"
LangString LangServiceName ${LANG_ENGLISH} "openHAB Service"
LangString LangServiceErrorOpeningFile1 ${LANG_ENGLISH} "Error opening file"
LangString LangServiceErrorOpeningFile2 ${LANG_ENGLISH} "to write"
LangString LangServiceErrorWritingFile ${LANG_ENGLISH} "Error writing to file"
LangString LangServiceErrorClosingFile ${LANG_ENGLISH} "Error closing to file"

LangString LangTaskUpdateDesc ${LANG_ENGLISH} "Updates openHAB to the latest version (either the latest snapshot if using snapshots or the next minor version if using stable [2.3.0->2.4.0])"
LangString LangTaskBackupDesc ${LANG_ENGLISH} "Backups the openHAB user files"
; use only alphanumerics, dash or backslash for task names - all else risks issues
LangString LangTaskUpdateName ${LANG_ENGLISH} "SystemUpdate"
LangString LangTaskBackupName ${LANG_ENGLISH} "UserFilesBackup"

LangString LangUninstallDisplayName ${LANG_ENGLISH} "openHAB - version"
LangString LangUninstallBackup ${LANG_ENGLISH} "Do you wish to delete your user file backups as well?"
LangString LangUninstallReboot ${LANG_ENGLISH} "A reboot is required to finish the uninstallation. Do you wish to reboot now?"

LangString LangMUIRunText ${LANG_ENGLISH} "Start openHAB console"
LangString LangMUIOpenPaperUI ${LANG_ENGLISH} "Open PaperUI (retry after be few minutes)"

LangString LangStopServiceExe ${LANG_ENGLISH} "Stopping openHAB service via utility"
LangString LangStopService ${LANG_ENGLISH} "Stopping openHAB services via windows (and waiting for service to end)"
LangString LangStopProcessKaraf ${LANG_ENGLISH} "Stopping openHAB process via Karaf (and wait up to 60 seconds to fully stop)"
LangString LangStopProcess ${LANG_ENGLISH} "Terminating all openHAB processes"
LangString LangDeleteServiceExe ${LANG_ENGLISH} "Deleting the openHAB service via utility"
LangString LangDeleteService ${LANG_ENGLISH} "Deleting the openHAB service via windows"

LangString LangAbortUpgradeUpdateBad ${LANG_ENGLISH} "Could not upgrade using update.ps1 - but update.ps1 was not found!"
LangString LangAbortUpgradeUninstallBad ${LANG_ENGLISH} "Could not uninstall prior to installing - but the uninstaller was not found!"
; -------------------------------------------------------------------------------
; Constants (non language based)
; -------------------------------------------------------------------------------
!define /file VERSIONS "openHAB-versions.txt"

!define AM "AM"
!define PM "PM"
!define CHECKBOX "checkbox"
!define RADIOBUTTON "radiobutton"

!define REGSUBKEY "Software\openHAB\installer" 

!define DAYMON "Mon"
!define DAYTUE "Tue"
!define DAYWED "Wed"
!define DAYTHU "Thu"
!define DAYFRI "Fri"
!define DAYSAT "Sat"
!define DAYSUN "Sun"

!define ADDONS "Addons"
!define BACKUPS "Backups"
!define CONF "Conf"
!define HOME "Home"
!define USERDATA "UserData"
!define RUNTIME "Runtime"

!define UPDATE "Update"
!define BACKUP "Backup"

!define TASKUSERLOCAL "NT AUTHORITY\LocalService"
!define TASKUSERADMIN "System"

!define OPENHABSERVICEID "openHAB"
!define OPENHABSERVICEEXE "openHAB-service.exe"
!define OPENHABSERVICEXML "openHAB-service.xml"

!define OPENHABUNINSTALLER "openHAB-uninstaller.exe"

; -------------------------------------------------------------------------------
; Installer settings
; -------------------------------------------------------------------------------
Name "openHAB"
OutFile ".\Output\openHAB-setup.exe"
ShowInstDetails show
ShowUnInstDetails show
RequestExecutionLevel admin
Icon ".\openhab_logo.ico"
BrandingText "$(LangBrandingText)"


; Note this is JUST longer than the 1024 limit of NSIS
;  so I've split the template up into two sections to be written
!define TASKTEMPLATE1 "<?xml version='1.0' encoding='UTF-16'?>\
        <Task version='1.2' xmlns='http://schemas.microsoft.com/windows/2004/02/mit/task'>\
          <RegistrationInfo>\
            <Date>$$CURRENTDATE</Date>\
            <Author>openHAB</Author>\
            <URI>\$$TASKNAME</URI>\
            <Description>$$DESC</Description>\
          </RegistrationInfo>\
          <Triggers>\
            <CalendarTrigger>\
              <StartBoundary>$$STARTDATE</StartBoundary>\
              <Enabled>true</Enabled>\
              $$SCHEDULEBY\
            </CalendarTrigger>\
          </Triggers>\
          <Principals>\
            <Principal id='Author'>\
              <GroupId>$$TASKUSER</GroupId>\
              <RunLevel>HighestAvailable</RunLevel>\
            </Principal>\
          </Principals>"

!define TASKTEMPLATE2 "\
          <Settings>\
            <IdleSettings>\
              <StopOnIdleEnd>true</StopOnIdleEnd>\
              <RestartOnIdle>false</RestartOnIdle>\
            </IdleSettings>\
            <MultipleInstancesPolicy>IgnoreNew</MultipleInstancesPolicy>\
            <DisallowStartIfOnBatteries>true</DisallowStartIfOnBatteries>\
            <StopIfGoingOnBatteries>true</StopIfGoingOnBatteries>\
            <AllowHardTerminate>true</AllowHardTerminate>\
            <StartWhenAvailable>false</StartWhenAvailable>\
            <RunOnlyIfNetworkAvailable>false</RunOnlyIfNetworkAvailable>\
            <AllowStartOnDemand>true</AllowStartOnDemand>\
            <Enabled>true</Enabled>\
            <Hidden>false</Hidden>\
            <RunOnlyIfIdle>false</RunOnlyIfIdle>\
            <WakeToRun>false</WakeToRun>\
            <ExecutionTimeLimit>PT10M</ExecutionTimeLimit>\
            <Priority>7</Priority>\
          </Settings>\
          <Actions Context='Author'>\
            <Exec>\
              <Command>powershell.exe</Command>\
              <Arguments>-ExecutionPolicy Bypass -command $\"&amp;{ . '$$OPENHAB_RUNTIME\bin\$$CMDPS1'; $$CMD *> '$$OPENHAB_USERDATA\logs\$$CMDPS1.log$\'}$\" </Arguments>\
              <WorkingDirectory>$$OPENHAB_HOME</WorkingDirectory>\
            </Exec>\
          </Actions>\
        </Task>"

!define /file SERVICETEMPLATE "..\Service\${OPENHABSERVICEXML}"

; -------------------------------------------------------------------------------
; Installer Pages
; -------------------------------------------------------------------------------
!define MUI_ABORTWARNING
!define MUI_LICENSEPAGE_RADIOBUTTONS
!define MUI_ICON ".\openhab_logo.ico"
!define MUI_UNICON ".\openhab_logo.ico"
!define MUI_LICENSEPAGE_CHECKBOX

!insertmacro MUI_RESERVEFILE_LANGDLL
!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_LICENSE "$(MUILicense)"
#!insertmacro MUI_PAGE_DIRECTORY
Page Custom CreateComponents LeaveComponents
Page Custom UpgradeOptions LeaveUpgradeOptions
Page Custom SelectDirectories LeaveDirectories
Page Custom CreateUpdateSchedule LeaveOverallUpdateSchedule
Page Custom CreateDailyUpdateSchedule LeaveDailyUpdateSchedule
Page Custom CreateWeeklyUpdateSchedule LeaveWeeklyUpdateSchedule
Page Custom CreateMonthlyUpdateSchedule LeaveMonthlyUpdateSchedule
Page Custom CreateBackupSchedule LeaveOverallBackupSchedule
Page Custom CreateDailyBackupSchedule LeaveDailyBackupSchedule
Page Custom CreateWeeklyBackupSchedule LeaveWeeklyBackupSchedule
Page Custom CreateMonthlyBackupSchedule LeaveMonthlyBackupSchedule
Page Custom CreateService LeaveService
!insertmacro MUI_PAGE_INSTFILES

!define MUI_PAGE_CUSTOMFUNCTION_SHOW CustomMUI
!define MUI_FINISHPAGE_NOAUTOCLOSE
!define MUI_FINISHPAGE_RUN
!define MUI_FINISHPAGE_RUN_TEXT "$(LangMUIRunText)"
!define MUI_FINISHPAGE_RUN_FUNCTION "LaunchOpenHAB"
!define MUI_FINISHPAGE_SHOWREADME
!define MUI_FINISHPAGE_SHOWREADME_TEXT "$(LangMUIOpenPaperUI)"
!define MUI_FINISHPAGE_SHOWREADME_FUNCTION "LaunchPaperUI"
!insertmacro MUI_PAGE_FINISH
  
!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES

!insertmacro MUI_LANGUAGE "English"
#!insertmacro MUI_LANGUAGE "Swedish"
#!insertmacro MUI_LANGUAGE "Russian"
#!insertmacro MUI_LANGUAGE "SimpChinese"
LicenseLangString MUILicense ${LANG_ENGLISH} "openHAB-license-en.txt"

; -------------------------------------------------------------------------------
; Macros
; -------------------------------------------------------------------------------
!macro Is24OrGreater Res Ver
  ${VersionCompare} "2.4.0" "${Ver}" $1
  ${If} $1 == "0"
  ${OrIf} $1 == "2"
    StrCpy ${Res} "1"
  ${Else}
    StrCpy ${Res} "0"
  ${EndIf}
!macroend

!macro Is22OrGreater Res Ver
  ${VersionCompare} "2.2.0" "${Ver}" $1
  ${If} $1 == "0"
  ${OrIf} $1 == "2"
    StrCpy ${Res} "1"
  ${Else}
    StrCpy ${Res} "0"
  ${EndIf}
!macroend

!macro SetEnvVar Name Val
  System::Call 'Kernel32::SetEnvironmentVariable(t, t)i ("${NAME}", "${VAL}").r0'
  EnVar::AddValue "${NAME}" "${VAL}"
!macroend

!macro ReadSetupInfo
  SetRegView 64
  ReadRegStr $StateDirectoryHome HKLM ${REGSUBKEY} "StateDirectoryHome"
  StrCpy $InstDir $StateDirectoryHome
  StrCpy $OutDir $StateDirectoryHome

  ReadRegStr $StateDirectoryAdvanced HKLM ${REGSUBKEY} "StateDirectoryAdvanced"
  ReadRegStr $StateDirectory${ADDONS} HKLM ${REGSUBKEY} "StateDirectory${Addons}"
  ReadRegStr $StateDirectory${BACKUPS} HKLM ${REGSUBKEY} "StateDirectory${Backups}"
  ReadRegStr $StateDirectory${CONF} HKLM ${REGSUBKEY} "StateDirectory${Conf}"
  ReadRegStr $StateDirectory${Home} HKLM ${REGSUBKEY} "StateDirectory${Home}"
  ReadRegStr $StateDirectory${UserData} HKLM ${REGSUBKEY} "StateDirectory${UserData}"
  ReadRegStr $StateDirectory${Runtime} HKLM ${REGSUBKEY} "StateDirectory${Runtime}"
  ReadRegStr $StateComponentSelected HKLM ${REGSUBKEY} "StateComponentSelected"
  ReadRegStr $StateComponentAddons HKLM ${REGSUBKEY} "StateComponentAddons"
  ReadRegStr $StateComponentLegacyAddons HKLM ${REGSUBKEY} "StateComponentLegacyAddons"
  ReadRegStr $StateCreateServiceEnabled HKLM ${REGSUBKEY} "StateCreateServiceEnabled"
  !insertmacro ReadScheduleVariables ${UPDATE}
  !insertmacro ReadScheduleVariables ${BACKUP}
  ClearErrors
!macroend

!macro WriteSetupInfo
  SetRegView 64
  WriteRegStr HKLM ${REGSUBKEY} "StateDirectoryHome" $StateDirectoryHome
  WriteRegStr HKLM ${REGSUBKEY} "StateDirectoryAdvanced" $StateDirectoryAdvanced
  WriteRegStr HKLM ${REGSUBKEY} "StateDirectory${Addons}" $StateDirectory${Addons}
  WriteRegStr HKLM ${REGSUBKEY} "StateDirectory${Backups}" $StateDirectory${Backups}
  WriteRegStr HKLM ${REGSUBKEY} "StateDirectory${Conf}" $StateDirectory${Conf}
  WriteRegStr HKLM ${REGSUBKEY} "StateDirectory${Home}" $StateDirectory${Home}
  WriteRegStr HKLM ${REGSUBKEY} "StateDirectory${UserData}" $StateDirectory${UserData}
  WriteRegStr HKLM ${REGSUBKEY} "StateDirectory${Runtime}" $StateDirectory${Runtime}
  WriteRegStr HKLM ${REGSUBKEY} "StateComponentSelected" $StateComponentSelected
  WriteRegStr HKLM ${REGSUBKEY} "StateComponentAddons" $StateComponentAddons
  WriteRegStr HKLM ${REGSUBKEY} "StateComponentLegacyAddons" $StateComponentLegacyAddons
  WriteRegStr HKLM ${REGSUBKEY} "StateCreateServiceEnabled" $StateCreateServiceEnabled
  !insertmacro WriteScheduleVariables ${UPDATE}
  !insertmacro WriteScheduleVariables ${BACKUP}
  ClearErrors
!macroend

!macro DeleteSetupInfo
  SetRegView 64
  DeleteRegKey HKLM ${REGSUBKEY}
  ClearErrors
!macroend

!macro GetVersions Num
  IntOp $5 0 + 0
  
  ${StrTok} $2 "${VERSIONS}" "=$\r$\n" "L" "1"
  ${Do}
    ${StrTok} $0 "${VERSIONS}" "=$\r$\n" "$5" "1"
    ${If} $0 != ""
      ${StrTrimNewLines} $1 $0
      Push $1
      IntOp $5 $5 + 1
    ${EndIF}
  ${LoopUntil} $0 == $2
  StrCpy ${Num} $5
!macroend

!macro BrowseDirectory SetTextTarget TitleText 
  ${NSD_GetText} ${SetTextTarget} $1
  nsDialogs::SelectFolderDialog "${TitleText}" $1
  pop $1
  ${IfNot} $1 == "error"
    ${NSD_SetText} ${SetTextTarget} $1
	${EndIf} 
!macroend

!macro CreateDirectory Desc Default Type y
  IntOp $1 ${y} - 2
  ${NSD_CreateLabel} 10u ${y}u 110u 12u "${Desc}"
  Pop $Directory${Type}Label
  ${NSD_CreateText} 121u "$1u" 128u 12u "${Default}"
  Pop $Directory${Type}
  ${IfNot} $StateDirectory${Type} == ""
    ${NSD_SetText} $Directory${Type} $StateDirectory${Type}
  ${EndIf}

  ${NSD_CreateBrowseButton} 259u "$1u" 32u 12u "$(LangBrowse)"
  Pop $Directory${Type}Browse
  ${NSD_OnClick} $Directory${Type}Browse BrowseDirectory${Type}
!macroend

!macro BrowseDirectoryCallback Type Desc
  Function BrowseDirectory${Type}
    !insertmacro BrowseDirectory $Directory${Type} "$(LangBrowseDirectory1) ${Desc} $(LangBrowseDirectory2)"
  FunctionEnd
!macroend

!macro EnableDirectory Type Switch
  EnableWindow $Directory${Type} ${Switch}
  EnableWindow $Directory${Type}Label ${Switch}
  EnableWindow $Directory${Type}Browse ${Switch}
!macroend

!macro CreateDirectoryUIVars Type
  Var Directory${Type}
  Var Directory${Type}Label
  Var Directory${Type}Browse
!macroend

!macro CreateFrequency Type Default y

  IntOp $1 ${y} - 2

  ${NSD_CreateLabel} 12u ${y}u 140u 12u "$(LangFrequency1) ${TYPE} $(LangFrequency2)"
  Pop $${TYPE}FrequencyLabel

  ${NSD_CreateDropList} 155u "$1u" 50u 12u "$(LangWeekly)"
  Pop $${TYPE}Frequency

  ${NSD_CB_AddString} $${TYPE}Frequency "$(LangDaily)"
  ${NSD_CB_AddString} $${TYPE}Frequency "$(LangWeekly)"
  ${NSD_CB_AddString} $${TYPE}Frequency "$(LangMonthly)"

  ${If} $State${TYPE}Frequency == ""
    ${NSD_CB_SelectString} $${TYPE}Frequency ${DEFAULT}
  ${Else} 
    ${NSD_CB_SelectString} $${TYPE}Frequency $State${TYPE}Frequency
  ${EndIf}
!macroend

!macro ValidateOverall Type
  Function ValidateOverall${TYPE}Time
    !insertmacro EnableNextButton

    ${NSD_GetState} $${TYPE}Time $1
    ${If} $1 == ${BST_CHECKED}
      ${NSD_GetText} $${TYPE}Hour $1
      IntCmp $1 1 +1 Disable +1
      IntCmp $1 12 +1 +1 Disable
      ${NSD_GetText} $${TYPE}Minute $1
      IntCmp $1 0 +1 Disable +1
      IntCmp $1 59 Success Success Disable

      Disable: 
        !insertmacro DisableNextButton

      Success:
        return
    ${EndIf}
  FunctionEnd
!macroend

!macro ValidateDaily Type
  Function ValidateDaily${TYPE}Time
    !insertmacro EnableNextButton
  FunctionEnd
!macroend

!macro ValidateWeekly Type
  Function ValidateWeekly${TYPE}Time
    !insertmacro EnableNextButton

    ${NSD_GetState} $${TYPE}${DAYMON} $1
    ${If} $1 == ${BST_CHECKED}
      Goto Success
    ${EndIf}
    ${NSD_GetState} $${TYPE}${DAYTUE} $1
    ${If} $1 == ${BST_CHECKED}
      Goto Success
    ${EndIf}
    ${NSD_GetState} $${TYPE}${DAYWED} $1
    ${If} $1 == ${BST_CHECKED}
      Goto Success
    ${EndIf}
    ${NSD_GetState} $${TYPE}${DAYTHU} $1
    ${If} $1 == ${BST_CHECKED}
      Goto Success
    ${EndIf}
    ${NSD_GetState} $${TYPE}${DAYFRI} $1
    ${If} $1 == ${BST_CHECKED}
      Goto Success
    ${EndIf}
    ${NSD_GetState} $${TYPE}${DAYSAT} $1
    ${If} $1 == ${BST_CHECKED}
      Goto Success
    ${EndIf}
    ${NSD_GetState} $${TYPE}${DAYSUN} $1
    ${If} $1 == ${BST_CHECKED}
      Goto Success
    ${EndIf}

    !insertmacro DisableNextButton

    Success:
      return
  FunctionEnd
!macroend

!macro ValidateMonthly Type
  Function ValidateMonthly${TYPE}Time
    !insertmacro EnableNextButton

    ${NSD_GetState} $${TYPE}SpecificDay $1
    ${If} $1 == ${BST_CHECKED}
      ${NSD_GetText} $${TYPE}Day $1
      IntCmp $1 1 +1 Disable +1
      IntCmp $1 31 Success Success Disable

      Disable: 
        !insertmacro DisableNextButton

      Success:
        return
    ${EndIf}

  FunctionEnd
!macroend

!macro TimeOptionChange Type
  Function ${TYPE}TimeOptionChange
    ${NSD_GetState} $${TYPE}Time $1
    EnableWindow $${TYPE}Hour $1
    EnableWindow $${TYPE}SemiColon $1
    EnableWindow $${TYPE}Minute $1
    EnableWindow $${TYPE}AmPm $1

    ${IfNot} $1 == ${BST_CHECKED}
      ${NSD_SetText} $${TYPE}Hour "12"
      ${NSD_SetText} $${TYPE}Minute "00"
      ${NSD_CB_SelectString} $${TYPE}AmPm ${AM}
    ${EndIf}
  FunctionEnd
!macroend

!macro DayUI Type Day Desc x y
  ${NSD_CreateCheckBox} "${x}u" "${y}u" 26u 12u "${Desc}"
  Pop $${TYPE}${DAY}
  ${NSD_OnClick} $${TYPE}${DAY} ValidateWeekly${TYPE}Time
  ${If} $State${TYPE}${DAY} == ""
  ${AndIf} ${DAY} == "Sat"
    ${NSD_Check} $${TYPE}${DAY}
  ${ElseIf} $State${TYPE}${DAY} == ${BST_CHECKED}
    ${NSD_Check} $${TYPE}${DAY}
  ${EndIf}
!macroend

!macro DayOptions Type y Desc
  ${NSD_CreateLabel} 10u ${y}u 100% 12u "${Desc}"

  IntOp $1 ${y} + 14
  !insertmacro DayUI "${Type}" "${DAYMON}" "$(LangDayMon)" "20u" $1
  !insertmacro DayUI "${Type}" "${DAYTUE}" "$(LangDayTue)" "50u" $1
  !insertmacro DayUI "${Type}" "${DAYWED}" "$(LangDayWed)" "80u" $1
  !insertmacro DayUI "${Type}" "${DAYTHU}" "$(LangDayThu)" "110u" $1
  !insertmacro DayUI "${Type}" "${DAYFRI}" "$(LangDayFri)" "140u" $1
  !insertmacro DayUI "${Type}" "${DAYSAT}" "$(LangDaySat)" "170u" $1
  !insertmacro DayUI "${Type}" "${DAYSUN}" "$(LangDaySun)" "200u" $1
!macroend

!macro TimeOptions Type y
  IntOp $R1 ${y} + 12
  IntOp $R2 ${y} + 26
  IntOp $R3 ${y} + 28
  ${NSD_CreateGroupBox} 22u "${y}u" 140u 48u ""
  ${NSD_CreateRadioButton} 28u "$R1u" 70u 12u "$(LangTimeMidnight)"
  ${NSD_AddStyle} $${TYPE}Midnight ${WS_GROUP}
  Pop $${TYPE}Midnight
  ${NSD_OnClick} $${TYPE}Midnight ${TYPE}TimeOptionChange
  ${If} $State${TYPE}Minute == "00"
  ${OrIf} $State${TYPE}Minute == "0"
  ${OrIf} $State${TYPE}Minute == ""
    ${If} $State${TYPE}Hour == ""
    ${AndIf} $State${TYPE}AmPm == ""
      ${NSD_Check} $${TYPE}Midnight
    ${ElseIf} $State${TYPE}Hour == "12"
    ${AndIf} $State${TYPE}AmPm == "$(LangTimeAM)"
      ${NSD_Check} $${TYPE}Midnight
    ${EndIf}
  ${EndIf}

  ${NSD_CreateRadioButton} 28u "$R2u" 24u 12u "$(LangTime)"
  Pop $${TYPE}Time
  ${NSD_OnClick} $${TYPE}Time ${TYPE}TimeOptionChange
  ${NSD_GetState} $${TYPE}Midnight $1
  ${If} $1 == ${BST_UNCHECKED}
    ${NSD_Check} $${TYPE}Time
  ${EndIf}

  ${NSD_CreateNumber} 58u "$R2u" 30u 12u "12"
  Pop $${TYPE}Hour
  !insertmacro UpDownBuddy $${TYPE}Hour 1 12 12
  ${NSD_OnChange} $${TYPE}Hour ValidateOverall${TYPE}Time
  ${IfNot} $State${TYPE}Hour == ""
    ${NSD_SetText} $${TYPE}Hour $State${TYPE}Hour
  ${EndIf}

  ${NSD_CreateLabel} 90u "$R3u" 4u 12u ":"
  Pop $${TYPE}SemiColon

  ${NSD_CreateNumber} 96u "$R2u" 30u 12u "00"
  Pop $${TYPE}Minute
  !insertmacro UpDownBuddy $${TYPE}Minute 0 59 0
  ${NSD_OnChange} $${TYPE}Hour ValidateOverall${TYPE}Time
  ${IfNot} $State${TYPE}Minute == ""
    ${NSD_SetText} $${TYPE}Minute $State${TYPE}Minute
  ${EndIf}

  ${NSD_CreateDropList} 128u "$R2u" 28u 12u "$(LangTimeAMPM)"
  Pop $${TYPE}AmPm
  ${NSD_CB_AddString} $${TYPE}AmPm ${AM}
  ${NSD_CB_AddString} $${TYPE}AmPm ${PM}
  ${NSD_CB_SelectString} $${TYPE}AmPm ${AM}
  ${IfNot} $State${TYPE}AmPm == ""
    ${NSD_SetText} $${TYPE}AmPm $State${TYPE}AmPm
  ${EndIf}
!macroend

!macro DayChoice Type y
  IntOp $R1 ${y} + 14
  IntOp $R2 $R1 + 14
  ${NSD_CreateRadioButton} 26u "${y}u" 100% 12u "$(LangDayAtBeginningOfMonth)"
  Pop $${TYPE}Beginning
  ${NSD_OnClick} $${TYPE}Beginning Monthly${TYPE}DayOptionChange
  ${NSD_AddStyle} $${TYPE}Beginning ${WS_GROUP}
  ${If} $State${TYPE}Day == "1"
    ${NSD_Check} $${TYPE}Beginning
  ${EndIf}

  ${NSD_CreateRadioButton} 26u "$R1u" 100% 12u "$(LangDayAtEndOfMonth)"
  Pop $${TYPE}End
  ${NSD_OnClick} $${TYPE}End Monthly${TYPE}DayOptionChange
  ${NSD_Check} $${TYPE}End
  ${If} $State${TYPE}Day == "31"
  ${OrIf} $State${TYPE}Day == ""
    ${NSD_Check} $${TYPE}End
  ${EndIf}

  ${NSD_CreateRadioButton} 26u "$R2u" 70u 12u "$(LangDayOnSpecificDay)"
  Pop $${TYPE}SpecificDay
  ${NSD_OnClick} $${TYPE}SpecificDay Monthly${TYPE}DayOptionChange
  ${NSD_GetState} $${TYPE}Beginning $1
  ${NSD_GetState} $${TYPE}End $2
  ${If} $1 == ${BST_UNCHECKED}
  ${AndIf} $2 == ${BST_UNCHECKED}
    ${NSD_Check} $${TYPE}SpecificDay
  ${EndIf}

  ${NSD_CreateNumber} 98u "$R2u" 30u 12u "31"
  Pop $${TYPE}Day
  !insertmacro UpDownBuddy $${TYPE}Day 1 31 31
  ${NSD_OnChange} $${TYPE}Day ValidateMonthly${TYPE}Time
  ${IfNot} $State${TYPE}Day == ""
    ${NSD_SetText} $${TYPE}Day $State${TYPE}Day
  ${EndIf}
!macroend

!macro DayOptionChange Type
  Function Monthly${TYPE}DayOptionChange
    ${NSD_GetState} $${TYPE}SpecificDay $1
    EnableWindow $${TYPE}Day $1

    ${NSD_GetState} $${TYPE}Beginning $1
    ${If} $1 == ${BST_CHECKED}
      ${NSD_SetText} $${TYPE}Day "1"
    ${EndIf}

    ${NSD_GetState} $${TYPE}End $1
    ${If} $1 == ${BST_CHECKED}
      ${NSD_SetText} $${TYPE}Day "31"
    ${EndIf}
    Call ValidateMonthly${TYPE}Time
  FunctionEnd
!macroend

!macro RecurDaysOptions Type y
  IntOp $R1 ${y} + 16
  IntOp $R2 $R1 - 2

  ${NSD_CreateLabel} 30u "${y}u" 80% 12u "$(LangDailyScheduleTitle)"

  ${NSD_CreateLabel} 40u "$R1u" 40u 12u "$(LangDailyScheduleRecur1)"

  ${NSD_CreateNumber} 82u "$R2u" 30u 12u "1"
  Pop $${TYPE}RecurDays
  !insertmacro UpDownBuddy $${TYPE}RecurDays 1 100 1
  ${IfNot} $State${TYPE}RecurDays == ""
    ${NSD_SetText} $${TYPE}RecurDays $State${TYPE}RecurDays
  ${EndIf}

  ${NSD_CreateLabel} 114u "$R1u" 24u 12u "$(LangDailyScheduleRecur2)"
!macroend

!macro OverallEnabledClick Type
  Function ${TYPE}EnabledClicked
    !insertmacro Is24OrGreater $2 $StateComponentSelected
    ${NSD_GetState} $${TYPE}Enabled $1
    EnableWindow $${TYPE}Frequency $1
    EnableWindow $${TYPE}FrequencyLabel $1

    ${If} $2 == "1"
      EnableWindow $${TYPE}MaxFiles $1
      EnableWindow $${TYPE}MaxFilesLabel $1
    ${Else}
      EnableWindow $${TYPE}MaxFiles 0
      EnableWindow $${TYPE}MaxFilesLabel 0
    ${EndIf}

    EnableWindow $${TYPE}MoreOptionsLabel $1
    EnableWindow $${TYPE}TimeLabel $1
    EnableWindow $${TYPE}Midnight $1
    EnableWindow $${TYPE}Time $1
    EnableWindow $${TYPE}Hour $1
    EnableWindow $${TYPE}SemiColon $1
    EnableWindow $${TYPE}Minute $1
    EnableWindow $${TYPE}AmPm $1
  FunctionEnd
!macroend

!macro LeaveOverallSchedule Type
  Function LeaveOverall${TYPE}Schedule
    ${NSD_GetState} $${TYPE}Enabled $State${TYPE}Enabled
    ${NSD_GetText} $${TYPE}Frequency $State${TYPE}Frequency
    ${NSD_GetText} $${TYPE}MaxFiles $State${TYPE}MaxFiles
    ${NSD_GetText} $${TYPE}Hour $State${TYPE}Hour
    ${NSD_GetText} $${TYPE}Minute $State${TYPE}Minute
    ${NSD_GetText} $${TYPE}AmPm $State${TYPE}AmPm
  FunctionEnd
!macroend

!macro LeaveDailySchedule Type
  Function LeaveDaily${TYPE}Schedule
    ${NSD_GetText} $${TYPE}RecurDays $State${TYPE}RecurDays
  FunctionEnd
!macroend

!macro LeaveWeeklySchedule Type
  Function LeaveWeekly${TYPE}Schedule
    ${NSD_GetState} $${TYPE}${DAYMON} $State${TYPE}${DAYMON}
    ${NSD_GetState} $${TYPE}${DAYTUE} $State${TYPE}${DAYTUE}
    ${NSD_GetState} $${TYPE}${DAYWED} $State${TYPE}${DAYWED}
    ${NSD_GetState} $${TYPE}${DAYTHU} $State${TYPE}${DAYTHU}
    ${NSD_GetState} $${TYPE}${DAYFRI} $State${TYPE}${DAYFRI}
    ${NSD_GetState} $${TYPE}${DAYSAT} $State${TYPE}${DAYSAT}
    ${NSD_GetState} $${TYPE}${DAYSUN} $State${TYPE}${DAYSUN}
  FunctionEnd
!macroend

!macro LeaveMonthlySchedule Type
  Function LeaveMonthly${TYPE}Schedule
    ${NSD_GetText} $${TYPE}Day $State${TYPE}Day
  FunctionEnd
!macroend

!macro IsFreqEnabled Type Freq
  ${If} $State${TYPE}Enabled == 0
    Abort
  ${EndIf}

  ${IfNot} $State${TYPE}Frequency == ${Freq}
    Abort
  ${EndIf}
!macroend

!macro CanScheduleTask Result
  !insertmacro Is24OrGreater $R0 $StateComponentSelected
  !insertmacro Is22OrGreater $R1 $StateComponentSelected
  ; assume false
  StrCpy ${RESULT} "0"

  ; if scheduled tasks ok for 2.4.0 or greater - good
  ; if 2.2.0 to 2.3.0 and not advanced - good
  ${If} $R0 == "1"
    StrCpy ${RESULT} "1"
  ${ElseIf} $R1 == "1"
  ${AndIf} $StateDirectoryAdvanced == ${BST_UNCHECKED}
    StrCpy ${RESULT} "1"
  ${EndIf}
  ; anything else (< 2.2.0 or 2.2.0-2.3.0 advanced) is bad
!macroend

!macro DisableNextButton
  GetDlgItem $0 $HWNDPARENT 1
  EnableWindow $0 0
!macroend

!macro EnableNextButton
  GetDlgItem $0 $HWNDPARENT 1
  EnableWindow $0 1
!macroend


!macro UpDownBuddy Src Min Max Init
  ${NSD_CreateUpDown} 0 0 0 0 ""
  Pop $1
  ${NSD_UD_SetBuddy} $1 ${Src}
	${MAKELONG} $2 $0 ${Max} ${Min}
	${NSD_UD_SetPackedRange} ${Src} $2
!macroend

!macro DefineScheduleVariables Type
  Var ${TYPE}Enabled
  Var ${TYPE}Frequency
  Var ${TYPE}FrequencyLabel
  Var ${TYPE}MaxFiles
  Var ${TYPE}MaxFilesLabel
  Var ${TYPE}MoreOptionsLabel
  Var ${TYPE}TimeLabel
  Var ${TYPE}Midnight
  Var ${TYPE}Time
  Var ${TYPE}Hour
  Var ${TYPE}SemiColon
  Var ${TYPE}Minute
  Var ${TYPE}AmPm
  Var ${TYPE}RecurDays
  Var ${TYPE}${DAYMON}
  Var ${TYPE}${DAYTUE}
  Var ${TYPE}${DAYWED}
  Var ${TYPE}${DAYTHU}
  Var ${TYPE}${DAYFRI}
  Var ${TYPE}${DAYSAT}
  Var ${TYPE}${DAYSUN}
  Var ${TYPE}Beginning
  Var ${TYPE}End
  Var ${TYPE}SpecificDay
  Var ${TYPE}Day

  Var State${TYPE}Enabled
  Var State${TYPE}Frequency
  Var State${TYPE}MaxFiles
  Var State${TYPE}Hour
  Var State${TYPE}Minute
  Var State${TYPE}AmPm
  Var State${TYPE}RecurDays
  Var State${TYPE}Mon
  Var State${TYPE}Tue
  Var State${TYPE}Wed
  Var State${TYPE}Thu
  Var State${TYPE}Fri
  Var State${TYPE}Sat
  Var State${TYPE}Sun
  Var State${TYPE}Day
!macroend

!macro ReadScheduleVariables Type
  ReadRegStr $State${TYPE}Enabled HKLM ${REGSUBKEY} "State${TYPE}Enabled"
  ReadRegStr $State${TYPE}Frequency HKLM ${REGSUBKEY} "State${TYPE}Frequency"
  ReadRegStr $State${TYPE}MaxFiles HKLM ${REGSUBKEY} "State${TYPE}MaxFiles"
  ReadRegStr $State${TYPE}Hour HKLM ${REGSUBKEY} "State${TYPE}Hour"
  ReadRegStr $State${TYPE}Minute HKLM ${REGSUBKEY} "State${TYPE}Minute"
  ReadRegStr $State${TYPE}AmPm HKLM ${REGSUBKEY} "State${TYPE}AmPm"
  ReadRegStr $State${TYPE}RecurDays HKLM ${REGSUBKEY} "State${TYPE}RecurDays"
  ReadRegStr $State${TYPE}Mon HKLM ${REGSUBKEY} "State${TYPE}Mon"
  ReadRegStr $State${TYPE}Tue HKLM ${REGSUBKEY} "State${TYPE}Tue"
  ReadRegStr $State${TYPE}Wed HKLM ${REGSUBKEY} "State${TYPE}Wed"
  ReadRegStr $State${TYPE}Thu HKLM ${REGSUBKEY} "State${TYPE}Thu"
  ReadRegStr $State${TYPE}Fri HKLM ${REGSUBKEY} "State${TYPE}Fri"
  ReadRegStr $State${TYPE}Sat HKLM ${REGSUBKEY} "State${TYPE}Sat"
  ReadRegStr $State${TYPE}Sun HKLM ${REGSUBKEY} "State${TYPE}Sun"
  ReadRegStr $State${TYPE}Day HKLM ${REGSUBKEY} "State${TYPE}Day"
!macroend
!macro WriteScheduleVariables Type
  WriteRegStr HKLM ${REGSUBKEY} "State${TYPE}Enabled" $State${TYPE}Enabled
  WriteRegStr HKLM ${REGSUBKEY} "State${TYPE}Frequency" $State${TYPE}Frequency
  WriteRegStr HKLM ${REGSUBKEY} "State${TYPE}MaxFiles" $State${TYPE}MaxFiles
  WriteRegStr HKLM ${REGSUBKEY} "State${TYPE}Hour" $State${TYPE}Hour
  WriteRegStr HKLM ${REGSUBKEY} "State${TYPE}Minute" $State${TYPE}Minute
  WriteRegStr HKLM ${REGSUBKEY} "State${TYPE}AmPm" $State${TYPE}AmPm
  WriteRegStr HKLM ${REGSUBKEY} "State${TYPE}RecurDays" $State${TYPE}RecurDays
  WriteRegStr HKLM ${REGSUBKEY} "State${TYPE}Mon" $State${TYPE}Mon
  WriteRegStr HKLM ${REGSUBKEY} "State${TYPE}Tue" $State${TYPE}Tue
  WriteRegStr HKLM ${REGSUBKEY} "State${TYPE}Wed" $State${TYPE}Wed
  WriteRegStr HKLM ${REGSUBKEY} "State${TYPE}Thu" $State${TYPE}Thu
  WriteRegStr HKLM ${REGSUBKEY} "State${TYPE}Fri" $State${TYPE}Fri
  WriteRegStr HKLM ${REGSUBKEY} "State${TYPE}Sat" $State${TYPE}Sat
  WriteRegStr HKLM ${REGSUBKEY} "State${TYPE}Sun" $State${TYPE}Sun
  WriteRegStr HKLM ${REGSUBKEY} "State${TYPE}Day" $State${TYPE}Day
!macroend

!macro DeleteEnvironmentVariables
  DetailPrint "$(LangLogDeleteExistingEnvironmentVariables)"
  EnVar::Delete "OPENHAB_ADDONS"
  EnVar::Delete "OPENHAB_BACKUPS"
  EnVar::Delete "OPENHAB_CONF"
  EnVar::Delete "OPENHAB_HOME"
  EnVar::Delete "OPENHAB_RUNTIME"
  EnVar::Delete "OPENHAB_USERDATA"
!macroend

!macro DeleteScheduledTask TaskName
  DetailPrint "$(LangLogDeleteScheduleTask1) ${TASKNAME} $(LangLogDeleteScheduleTask2)"     
 ; StrCpy $1 "/DELETE /TN $\"${TASKNAME}$\" /F"
  nsExec::ExecToLog '"$SYSDIR\schtasks.exe" /DELETE /TN $\"openHAB\${TASKNAME}$\" /F'
  Pop $1
  ; don't worry about deleting return code check
  ;ExecWait '"$SYSDIR\schtasks.exe" $1' ; don't worry if it couldn't be deleted
!macroend

!macro CreateScheduledTask Type TaskName CmdPs1 Cmd Desc
  !insertmacro CanScheduleTask $0
  ${If} $0 == "1"
    !insertmacro "GetOpenHABTaskCount" "$0"
    ${IfNot} $0 == "0"
      !insertmacro "DeleteScheduledTask" "${TaskName}"
    ${EndIf}

    ; $5 - home directory
    ; $6 - runtime directory
    ; $7 - userdata directory
    ; $8 - current time
    ; $R8 - the first half to the template
    ; $R9 - the second half to the template
    ${GetTime} "" "L" $1 $2 $3 $4 $5 $6 $7
    IntFmt $5 "%02d" $5
    IntFmt $6 "%02d" $6
    IntFmt $7 "%02d" $7
    StrCpy $8 "$3-$2-$1T$5:$6:$7"

    StrCpy $R8 "${TASKTEMPLATE1}"
    StrCpy $R9 "${TASKTEMPLATE2}"

    ${If} $State${TYPE}AmPm == ${PM}
    ${AndIfNot} $State${TYPE}Hour == "12"
      IntOp $State${TYPE}Hour $State${TYPE}Hour + 12
    ${EndIf}
    IntFmt $R1 "%02d" $State${TYPE}Hour
    IntFmt $R2 "%02d" $State${TYPE}Minute
    StrCpy $R3 "$3-$2-$1T$R1:$R2:00"

    ${StrRep} $R8 $R8 "$$CURRENTDATE" $8
    ${StrRep} $R8 $R8 "$$STARTDATE" $R3
    ${StrRep} $R8 $R8 "$$TASKNAME" "openHAB\${TASKNAME}"
    ${StrRep} $R8 $R8 "$$DESC" "${DESC}"
    ${StrRep} $R9 $R9 "$$OPENHAB_HOME" "$StateDirectoryHome"
    ${StrRep} $R9 $R9 "$$OPENHAB_RUNTIME" "$StateDirectoryRuntime"
    ${StrRep} $R9 $R9 "$$OPENHAB_USERDATA" "$StateDirectoryUserData"
    ${StrRep} $R9 $R9 "$$CMDPS1" ${CMDPS1}
    ${StrRep} $R9 $R9 "$$CMD" ${CMD}
    
    !insertmacro Is24OrGreater $0 $StateComponentSelected
    ${If} $0 == "1"
      ${StrRep} $R8 $R8 "$$TASKUSER" "${TASKUSERLOCAL}"
    ${Else}
      ${StrRep} $R8 $R8 "$$TASKUSER" "${TASKUSERADMIN}"
    ${EndIf}

    ${If} $State${TYPE}Frequency == $(LangDaily)
      StrCpy $4 "<ScheduleByDay><DaysInterval>"
      StrCpy $4 "$4$State${TYPE}RecurDays"
      StrCpy $4 "$4</DaysInterval></ScheduleByDay>"
      ${StrRep} $R8 $R8 "$$SCHEDULEBY" $4
    ${ElseIf} $State${TYPE}Frequency == $(LangWeekly)
        StrCpy $4 "<ScheduleByWeek><DaysOfWeek>"
        ${If} $State${TYPE}Mon == ${BST_CHECKED}
          StrCpy $4 "$4<Monday />"
        ${EndIf}
        ${If} $State${TYPE}Tue == ${BST_CHECKED}
          StrCpy $4 "$4<Tuesday />"
        ${EndIf}
        ${If} $State${TYPE}Wed == ${BST_CHECKED}
          StrCpy $4 "$4<Wednesday />"
        ${EndIf}
        ${If} $State${TYPE}Thu == ${BST_CHECKED}
          StrCpy $4 "$4<Thursday />"
        ${EndIf}
        ${If} $State${TYPE}Fri == ${BST_CHECKED}
          StrCpy $4 "$4<Friday />"
        ${EndIf}
        ${If} $State${TYPE}Sat == ${BST_CHECKED}
          StrCpy $4 "$4<Saturday />"
        ${EndIf}
        ${If} $State${TYPE}Sun == ${BST_CHECKED}
          StrCpy $4 "$4<Sunday />"
        ${EndIf}
        StrCpy $4 "$4</DaysOfWeek><WeeksInterval>1</WeeksInterval></ScheduleByWeek>"
        ${StrRep} $R8 $R8 "$$SCHEDULEBY" $4
    ${Else}
      StrCpy $4 "<ScheduleByMonth><DaysOfMonth><Day>"
      ${If} $State${TYPE}Day == "31"
        StrCpy $4 "$4Last"
      ${Else}
        StrCpy $4 "$4$State${TYPE}Day"
      ${EndIf}
      StrCpy $4 "$4</Day></DaysOfMonth><Months><January /><February /><March /><April /><May /><June /><July /><August /><September /><October /><November /><December /></Months></ScheduleByMonth>"
      ${StrRep} $R8 $R8 "$$SCHEDULEBY" $4
    ${EndIf}

    StrCpy $5 "$StateDirectoryHome\task-${TYPE}.xml"
    ClearErrors
    FileOpen $4 "$5" w
    ${If} ${Errors}
      Abort "Error opening file '$5' to write"
    ${EndIf}

    FileWrite $4 $R8
    ${If} ${Errors}
      Abort "Error writing to file '$5'"
    ${EndIf}
    FileWrite $4 $R9
    ${If} ${Errors}
      Abort "Error writing to file '$5'"
    ${EndIf}

    FileClose $4
    ${If} ${Errors}
      Abort "Error closing file '$5'"
    ${EndIf}

    nsExec::ExecToLog '"$SYSDIR\schtasks.exe" /CREATE /XML "$5" /TN "openHAB\${TASKNAME}"'
    Pop $1
    ;ExecWait '"$SYSDIR\schtasks.exe" /CREATE /XML "$StateDirectoryRuntime" /TN "${TASKNAME}"' $1
    ${IfNot} $1 == "0"
      Abort "Could not schedule the update task: $1"
    ${EndIf}

    Delete "$5" ; don't worry if it's successful or not
  ${EndIf}
!macroend

!macro CheckUpgrade
  ${If} $TempUpgradeOption == ${UPGRADEOPTION_UPDATE}
    Abort
  ${EndIf}
!macroend

!macro GetServiceState Output
  ; This macro will return the status values from ServiceControllerStatus
  ; or blank if service doesn't exist
  Push $R9 ; save value since we use this
  nsExec::ExecToStack "powershell.exe -ExecutionPolicy Bypass -command $\"&{ get-service -name '${OPENHABSERVICEID}' -ErrorAction SilentlyContinue | %{$$_.Status} }$\""
  Pop $R9
  Pop ${Output}
  Pop $R9
  !ifdef __UNINSTALL__
    ${UnStrTrimNewLines} ${Output} "${Output}"
	!else
    ${StrTrimNewLines} ${Output} "${Output}"
	!endif
!macroend

!macro GetOpenHABProcessCount Output
  Push $R9 ; save value since we use this
  nsExec::ExecToStack "powershell.exe -ExecutionPolicy Bypass -command $\"&{ Get-WMIObject Win32_Process | Where-Object { $$_.Name -eq 'java.exe' -and $$_.CommandLine -like '*openhab*'} | Measure-Object | Select-Object -expand Count }$\""
  Pop $R9
  Pop ${Output}
  Pop $R9
  !ifdef __UNINSTALL__
    ${UnStrTrimNewLines} ${Output} "${Output}"
	!else
    ${StrTrimNewLines} ${Output} "${Output}"
	!endif
!macroend

!macro GetOpenHABServiceCount Output
  Push $R9 ; save value since we use this
  nsExec::ExecToStack "powershell.exe -ExecutionPolicy Bypass -command $\"&{ get-service -name ${OPENHABSERVICEID} -ErrorAction SilentlyContinue | Measure-Object | Select-Object -expand Count }$\""
  Pop $R9
  Pop ${Output}
  Pop $R9
  !ifdef __UNINSTALL__
    ${UnStrTrimNewLines} ${Output} "${Output}"
	!else
    ${StrTrimNewLines} ${Output} "${Output}"
	!endif
!macroend

!macro GetOpenHABTaskCount Output
  Push $R9 ; save value since we use this
  nsExec::ExecToStack "powershell.exe -ExecutionPolicy Bypass -command $\"&{ get-scheduledtask -TaskPath '\openHAB\' -ErrorAction SilentlyContinue | Measure-Object | Select-Object -expand Count }$\""
  Pop $R9
  Pop ${Output}
  Pop $R9
  !ifdef __UNINSTALL__
    ${UnStrTrimNewLines} ${Output} "${Output}"
	!else
    ${StrTrimNewLines} ${Output} "${Output}"
	!endif
!macroend

!macro DeleteService OHHome
  !insertmacro "GetOpenHABServiceCount" $R8
  ${IfNot} $R8 == "0"
  ${AndIf} ${FileExists} "${OHHome}\${OPENHABSERVICEEXE}"
    DetailPrint "$(LangDeleteServiceExe)"
    nsExec::ExecToLog '"${OHHome}\${OPENHABSERVICEEXE}" uninstall'
  ${EndIf}
 
  ; Force delete any service  
  !insertmacro "GetOpenHABServiceCount" $R8
  ${IfNot} $R8 == "0"
    DetailPrint "$(LangDeleteService)"
    nsExec::ExecToLog "powershell.exe -ExecutionPolicy Bypass -command $\"&{ get-service -name ${OPENHABSERVICEID} -ErrorAction SilentlyContinue | foreach-object { sc.exe delete $$_.Name } }$\""
  ${EndIf}
!macroend

!macro DeleteOpenHAB Home Addons Backups Conf RunTime UserData
  !insertmacro "DeleteService" "${Home}"

  ; delete the tasks
  DetailPrint "$(LangLogUninstallingTasks)"
  !insertmacro DeleteScheduledTask "$(LangTaskUpdateName)"  
  !insertmacro DeleteScheduledTask "$(LangTaskBackupName)"  
  
  ; delete the overall folder
  nsExec::ExecToLog '"$SYSDIR\schtasks.exe" /DELETE /TN $\"openHAB$\" /F'

  !insertmacro DeleteEnvironmentVariables

  ; set working to temp in case we are trying to delete the current working directory
  SetOutPath $TEMP

  DetailPrint "$(LangLogRemovingDirectories)"
  !ifdef __UNINSTALL__
    RMDir /r /REBOOTOK "${Addons}"
    RMDir /r /REBOOTOK "${Conf}"
    RMDir /r /REBOOTOK "${Runtime}"
    RMDir /r /REBOOTOK "${UserData}"
  !else
    RMDir /r "${Addons}"
    RMDir /r "${Conf}"
    RMDir /r "${Runtime}"
    RMDir /r "${UserData}"
  !endif

  ClearErrors
  RMDir "${Backups}" ; will fail if files present
  ${If} ${Errors}
    MessageBox MB_YESNO "$(LangUninstallBackup)" IDYES DeleteBackups
    !ifdef __UNINSTALL__
      Delete /REBOOTOK "${Home}\*.*"
    !else
      Delete "${Home}\*.*"
    !endif
    Goto DeleteSetup
  ${EndIf}

  DeleteBackups:
    DetailPrint "$(LangLogDeleteBackups)"
    !ifdef __UNINSTALL__
      RMDir /r /REBOOTOK "${Backups}"
      RMDir /r /REBOOTOK "${Home}"
    !else
      RMDir /r "${Backups}"
      RMDir /r "${Home}"
    !endif

  DeleteSetup:

  DetailPrint "$(LangLogDeleteSetupInfo)"
  DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\openHAB"
  !insertmacro DeleteSetupInfo
  ${If} ${RebootFlag}
    MessageBox MB_YESNO "$(LangUninstallReboot)" IDNO DeleteSetupInfoDone     
    Reboot
  ${EndIf}
  
  DeleteSetupInfoDone: 
!macroend

!macro StopOpenHAB Output OHRuntime
  ; save since we use them
  Push $R8 
  Push $R7

  StrCpy ${Output} "0"
  ; -------------- First - try to stop the service...

  ; If we have a non-blank service state (we have a service)...
  !insertmacro "GetOpenHABServiceCount" $R8
  ${IfNot} $R8 == "0"
    !insertmacro "GetServiceState" $R7
    ${IfNot} $R7 == "Stopped"
      StrCpy ${Output} "1"
      ;  stop-service will wait until the service is fully stopped
      DetailPrint "$(LangStopService)"
      nsExec::ExecToLog "powershell.exe -ExecutionPolicy Bypass -command $\"&{ stop-service -name '${OPENHABSERVICEID}' -ErrorAction SilentlyContinue }$\""
    ${EndIf}
  ${EndIf}

  ; -------------- Now kill any processes ...

  ; Check to see if there are any openhab processes running
  !insertmacro "GetOpenHABProcessCount" $R8
  ${IfNot} $R8 == "0"
    ; Call the karaf.bat to stop the service naturally
    ${If} ${FileExists} "${OHRuntime}\bin\karaf.bat"
      StrCpy ${Output} "1"
      DetailPrint "$(LangStopProcessKaraf)"
      nsExec::ExecToLog "${OHRuntime}\bin\karaf.bat stop"
      ; Wait up to 60 seconds for the process to stop on it's own
      ${ForEach} $R7 1 60 + 1
        !insertmacro "GetOpenHABProcessCount" $R8
        ; kinda weird - don't sleep if there are 0 process
        ; that way we rip through the 60
        ${IfNot} $R8 == "0"
          Sleep 1000
        ${EndIf}
      ${Next}
    ${EndIf}

    ; Recheck and if it still exists, blow it away instead
    !insertmacro "GetOpenHABProcessCount" $R8
    ${IfNot} $R8 == 0
      StrCpy ${Output} "1"
      DetailPrint "$(LangStopProcess)"
      nsExec::ExecToLog "powershell.exe -ExecutionPolicy Bypass -command $\"&{ Get-WMIObject Win32_Process | Where-Object { $$_.Name -eq 'java.exe' -and $$_.CommandLine -like '*openhab*'} | Foreach-Object { $$_.terminate() }}$\""
    ${EndIf}
  ${EndIf}


  ; restore vars
  Pop $R7
  Pop $R8
!macroend

; -------------------------------------------------------------------------------
; Helper functions
; -------------------------------------------------------------------------------
Function GetJavaPath
  SetRegView 64
  ReadRegStr $1 HKLM "SOFTWARE\JavaSoft\Java Runtime Environment" "CurrentVersion"
  StrCmp $1 "" DetectTry2
  ReadRegStr $2 HKLM "SOFTWARE\JavaSoft\Java Runtime Environment\$1" "JavaHome"
  StrCmp $2 "" NotFound
  goto Found

  DetectTry2:
    ReadRegStr $1 HKLM "SOFTWARE\JavaSoft\Java Development Kit" "CurrentVersion"
    StrCmp $1 "" NotFound
    ReadRegStr $2 HKLM "SOFTWARE\JavaSoft\Java Development Kit\$1" "JavaHome"
    StrCmp $2 "" NotFound
    
  Found:
    push $2
    return
  NotFound:
    push ""
    return
FunctionEnd

; -------------------------------------------------------------------------------
; Directory Selection Variables
; -------------------------------------------------------------------------------
Var DirectoryHome
Var DirectoryHomeBrowse

Var AdvancedDirectory

!insertmacro CreateDirectoryUIVars "${ADDONS}"
!insertmacro CreateDirectoryUIVars "${BACKUPS}"
!insertmacro CreateDirectoryUIVars "${CONF}"
!insertmacro CreateDirectoryUIVars "${RUNTIME}"
!insertmacro CreateDirectoryUIVars "${USERDATA}"

Var StateDirectory${HOME}
Var StateDirectoryAdvanced
Var StateDirectory${ADDONS}
Var StateDirectory${BACKUPS}
Var StateDirectory${CONF}
Var StateDirectory${USERDATA}
Var StateDirectory${RUNTIME}

; -------------------------------------------------------------------------------
; Upgrade options
; -------------------------------------------------------------------------------
!define UPGRADEOPTION_DONOTHING "doNothing"
!define UPGRADEOPTION_UPDATE "update"
!define UPGRADEOPTION_UNINSTALL "uninstall"
!define UPGRADEOPTION_DELETE "delete"

Var UpgradeUpdate
Var UpgradeUninstall
Var UpgradeDelete
Var UpgradeDoNothing

Var TempUpgradeOption

; The following variables are not persisted
Var TempUpgradeAddons
Var TempUpgradeBackup
Var TempUpgradeConf
Var TempUpgradeHome
Var TempUpgradeUserData
Var TempUpgradeRuntime

; -------------------------------------------------------------------------------
; Component Selection Variables
; -------------------------------------------------------------------------------
Var ComponentDialogSelection
Var ComponentAddons
Var ComponentLegacyAddons

Var StateComponentSelected
Var StateComponentAddons
Var StateComponentLegacyAddons

; -------------------------------------------------------------------------------
; Update Schedule Variables
; -------------------------------------------------------------------------------
!insertmacro DefineScheduleVariables ${UPDATE}

; -------------------------------------------------------------------------------
; Backup Schedule Variables
; -------------------------------------------------------------------------------
!insertmacro DefineScheduleVariables ${BACKUP}

; -------------------------------------------------------------------------------
; File Downloads
; -------------------------------------------------------------------------------
Var FileDistribution
Var FileAddons
Var FileLegacyAddons

; -------------------------------------------------------------------------------
; Service
; -------------------------------------------------------------------------------
Var ServiceEnabled
Var StateCreateServiceEnabled

; -------------------------------------------------------------------------------
; Directory selection dialog functions
; -------------------------------------------------------------------------------
Function SelectDirectories
  !insertmacro "CheckUpgrade"
  !insertmacro MUI_HEADER_TEXT "$(LangSelectDirectoriesHeader1)" "$(LangSelectDirectoriesHeader2)"
  nsDialogs::Create 1018
  Pop $1
  ${If} $1 == error
		Abort
	${EndIf} 

  ${NSD_CreateLabel} 0 0u 100% 24u "$(LangSelectDirectoriesDesc)" 

  ${NSD_CreateText} 12u 26u 128u 12u "c:\openhab2"
  Pop $DirectoryHome
  ${NSD_OnChange} $DirectoryHome DirectoryChange
  ${IfNot} $StateDirectoryHome == ""
    ${NSD_SetText} $DirectoryHome $StateDirectoryHome
  ${EndIf}

  ${NSD_CreateBrowseButton} 150u 26u 32u 12u "$(LangBrowse)"
  Pop $DirectoryHomeBrowse
  ${NSD_OnClick} $DirectoryHomeBrowse BrowseDirectoryHome

  ${NSD_CreateCheckBox} 190u 26u 50% 12u "$(LangSelectDirectoriesAdvanced)"
  Pop $AdvancedDirectory
  ${NSD_OnClick} $AdvancedDirectory AdvanceBrowseCheck
  ${If} $StateDirectoryAdvanced == ${BST_CHECKED}
    ${NSD_Check} $AdvancedDirectory
  ${EndIf}

  !insertmacro CreateDirectory "$(LangSelectDirectoriesAddons)" "c:\openhab2\addons" "${ADDONS}" 60
  !insertmacro CreateDirectory "$(LangSelectDirectoriesBackups)" "c:\openhab2\backups" "${BACKUPS}" 75
  !insertmacro CreateDirectory "$(LangSelectDirectoriesConf)" "c:\openhab2\conf" "${CONF}" 90
  !insertmacro CreateDirectory "$(LangSelectDirectoriesUserData)" "c:\openhab2\userdata" "${USERDATA}" 105
  !insertmacro CreateDirectory "$(LangSelectDirectoriesRuntime)" "c:\openhab2\runtime" "${RUNTIME}" 120

  Call AdvanceBrowseCheck

  nsDialogs::Show
FunctionEnd

!insertmacro BrowseDirectoryCallback "Addons" "$(LangSelectDirectoriesAddons)"
!insertmacro BrowseDirectoryCallback "Backups" "$(LangSelectDirectoriesBackups)"
!insertmacro BrowseDirectoryCallback "Conf" "$(LangSelectDirectoriesConf)"
!insertmacro BrowseDirectoryCallback "Home" "$(LangSelectDirectoriesHome)"
!insertmacro BrowseDirectoryCallback "Runtime" "$(LangSelectDirectoriesRuntime)"
!insertmacro BrowseDirectoryCallback "UserData" "$(LangSelectDirectoriesUserData)"

Function DirectoryChange
  ${NSD_GetText} $DirectoryHome $1
  ${NSD_SetText} $Directory${ADDONS} "$1\addons"
  ${NSD_SetText} $Directory${BACKUPS} "$1\backups"
  ${NSD_SetText} $Directory${CONF} "$1\conf"
  ${NSD_SetText} $Directory${USERDATA} "$1\userdata"
  ${NSD_SetText} $Directory${RUNTIME} "$1\runtime"
FunctionEnd

Function AdvanceBrowseCheck
  ${NSD_GetState} $AdvancedDirectory $1

  ; addons/runtime is always disabled until we fix scripts
  ; to allow them (future version check)
  !insertmacro EnableDirectory ${ADDONS} 0
  !insertmacro EnableDirectory ${BACKUPS} $1
  !insertmacro EnableDirectory ${CONF} $1
  !insertmacro EnableDirectory ${USERDATA} $1
  !insertmacro EnableDirectory ${RUNTIME} $1
FunctionEnd

Function LeaveDirectories
  ${NSD_GetState} $AdvancedDirectory $StateDirectoryAdvanced
  ${NSD_GetText} $DirectoryHome $StateDirectoryHome

  ${If} $StateDirectoryAdvanced == ${BST_CHECKED}
    ${NSD_GetText} $DirectoryAddons $StateDirectoryAddons
    ${NSD_GetText} $DirectoryBackups $StateDirectoryBackups
    ${NSD_GetText} $DirectoryConf $StateDirectoryConf
    ${NSD_GetText} $DirectoryUserData $StateDirectoryUserData
    ${NSD_GetText} $DirectoryRuntime $StateDirectoryRuntime
  ${Else}
    StrCpy $StateDirectoryAddons "$StateDirectoryHome\addons"
    StrCpy $StateDirectoryConf "$StateDirectoryHome\conf"
    StrCpy $StateDirectoryBackups "$StateDirectoryHome\backups"
    StrCpy $StateDirectoryUserData "$StateDirectoryHome\userdata"
    StrCpy $StateDirectoryRuntime "$StateDirectoryHome\runtime"
  ${EndIf}

  StrCpy $1 ""
  ${If} ${FileExists} "$StateDirectoryHome"
    StrCpy $1 "$1$\t$StateDirectoryHome$\r$\n"
  ${EndIf}

  ${If} ${FileExists} "$StateDirectoryAddons"
    StrCpy $1 "$1$\t$StateDirectoryAddons$\r$\n"
  ${EndIf}
  
  ;${If} ${FileExists} "$StateDirectoryBackups"
  ;  StrCpy $1 "$1\t$StateDirectoryBackups\r\n"
  ;${EndIf}
  
  ${If} ${FileExists} "$StateDirectoryConf"
    StrCpy $1 "$1$\t$StateDirectoryConf$\r$\n"
  ${EndIf}
  
  ${If} ${FileExists} "$StateDirectoryRuntime"
    StrCpy $1 "$1$\t$StateDirectoryRuntime$\r$\n"
  ${EndIf}
  
  ${If} ${FileExists} "$StateDirectoryUserData"
    StrCpy $1 "$1$\t$StateDirectoryUserData$\r$\n"
  ${EndIf}
  
  ${IfNot} $1 == ""
    MessageBox MB_YESNO "$(LangBrowseDirectoryExists1)$\r$\n$\r$\n$1$\r$\n$\r$\n$(LangBrowseDirectoryExists2)" IDYES Continue
    Abort
  ${EndIf}
  Continue:
  StrCpy $INSTDIR $StateDirectoryHome
  StrCpy $OUTDIR $StateDirectoryHome
FunctionEnd

; -------------------------------------------------------------------------------
; Upgrade Options dialog functions
; -------------------------------------------------------------------------------
Function UpgradeOptions
  ; default option
  StrCpy $TempUpgradeOption ${UPGRADEOPTION_DONOTHING}

  ReadEnvStr $TempUpgradeHome "OPENHAB_HOME"
  ${IfNot} $TempUpgradeHome == ""
    StrCpy $TempUpgradeHome "c:\openhab2"
  ${EndIf}

  ReadEnvStr $TempUpgradeAddons "OPENHAB_ADDONS"
  ${If} $TempUpgradeAddons == ""
    StrCpy $TempUpgradeAddons "$TempUpgradeHome\addons"
  ${EndIf}

  ReadEnvStr $TempUpgradeBackup "OPENHAB_BACKUP"
  ${If} $TempUpgradeBackup == ""
    StrCpy $TempUpgradeBackup "$TempUpgradeHome\backups"
  ${EndIf}

  ReadEnvStr $TempUpgradeConf "OPENHAB_CONF"
  ${If} $TempUpgradeConf == ""
    StrCpy $TempUpgradeConf "$TempUpgradeHome\conf"
  ${EndIf}

  ReadEnvStr $TempUpgradeRuntime "OPENHAB_RUNTIME"
  ${If} $TempUpgradeRuntime == ""
    StrCpy $TempUpgradeRuntime "$TempUpgradeHome\runtime"
  ${EndIf}

  ReadEnvStr $TempUpgradeUserData "OPENHAB_USERDATA"
  ${If} $TempUpgradeUserData == ""
    StrCpy $TempUpgradeUserData "$TempUpgradeHome\userdata"
  ${EndIf}

  ${If} ${FileExists} "$TempUpgradeUserData\etc\version.properties"
    ${ConfigRead} "$TempUpgradeUserData\etc\version.properties" "openhab-core" $R1
    ${WordReplace} "$R1" "=" "" "+" $R1
    ${WordReplace} "$R1" ":" "" "+" $R1
    ${WordReplace} "$R1" "$\t" "" "{}" $R1
    ${WordReplace} "$R1" " " "" "{}" $R1  
  ${EndIf}

  ; If nothing, ignore this dialog
  ${If} $R1 == ""
    Abort
  ${EndIf}

  !insertmacro MUI_HEADER_TEXT "$(LangUpgradeOptionsHeader1)" "$(LangUpgradeOptionsHeader2)"
  nsDialogs::Create 1018
  Pop $1
  ${If} $1 == error
		Abort
	${EndIf} 

  ${NSD_CreateLabel} 0 0u 100% 24u "$(LangUpgradeOptionsDesc1) $R1 $(LangUpgradeOptionsDesc2)" 

  StrCpy $4 "0"
  ${If} ${FileExists} "$TempUpgradeRuntime\bin\update.ps1"
    IntOp $4 $4 + 24
    ${NSD_CreateRadioButton} 5% "$4u" 80% 24u "$(LangUpgradeOptionsUpgdate)"
    Pop $UpgradeUpdate
  ${EndIf}

  IntOp $4 $4 + 24
  ${If} ${FileExists} "$TempUpgradeHome\${OPENHABUNINSTALLER}"
    ${NSD_CreateRadioButton} 5% "$4u" 80% 24u "$(LangUpgradeOptionsUninstall)"
    Pop $UpgradeUninstall
  ${Else}
    ${NSD_CreateRadioButton} 5% "$4u" 80% 24u "$(LangUpgradeOptionsDelete)"
    Pop $UpgradeDelete
  ${EndIf}

  ${If} ${FileExists} "$TempUpgradeRuntime\bin\update.ps1"
    ${NSD_Check} $UpgradeUpdate
  ${ElseIf} ${FileExists} "$TempUpgradeHome\${OPENHABUNINSTALLER}"
    ${NSD_Check} $UpgradeUninstall
  ${Else}
    ${NSD_Check} $UpgradeDelete
  ${EndIf}

  IntOp $4 $4 + 24
  ${NSD_CreateRadioButton} 5% "$4u" 80% 24u "$(LangUpgradeOptionsDoNothing)"
  Pop $UpgradeDoNothing

  nsDialogs::Show
FunctionEnd

Function LeaveUpgradeOptions
  StrCpy $TempUpgradeOption ${UPGRADEOPTION_DONOTHING}

  ${NSD_GetState} $UpgradeUpdate $1
  ${If} $1 == ${BST_CHECKED}
    StrCpy $TempUpgradeOption ${UPGRADEOPTION_UPDATE}
  ${EndIf}

  ${NSD_GetState} $UpgradeUninstall $1
  ${If} $1 == ${BST_CHECKED}
    StrCpy $TempUpgradeOption ${UPGRADEOPTION_UNINSTALL}
  ${EndIf}
  
  ${NSD_GetState} $UpgradeDelete $1
  ${If} $1 == ${BST_CHECKED}
    StrCpy $TempUpgradeOption ${UPGRADEOPTION_DELETE}
  ${EndIf}  
FunctionEnd

; -------------------------------------------------------------------------------
; Component selection dialog functions
; -------------------------------------------------------------------------------
Function CreateComponents
  !insertmacro MUI_HEADER_TEXT "$(LangComponentsHeader1)" "$(LangComponentsHeader2)"
  nsDialogs::Create 1018
  Pop $1
  ${If} $1 == error
		Abort
	${EndIf}  

  ${NSD_CreateLabel} 0u 3u 120u 12u "$(LangComponentsDesc)" 
  ${NSD_CreateDropList} 124u 0u 200 200 "$(LangComponentsComponent)"
  Pop $ComponentDialogSelection

  !insertmacro GetVersions $1

  ${ForEach} $2 1 $1 + 2
    Pop $3
    Pop $4
    ${NSD_CB_AddString} $ComponentDialogSelection "$3"
    ${If} $StateComponentSelected == ""
    ${OrIf} $4 == $StateComponentSelected
      ${NSD_CB_SelectString} $ComponentDialogSelection $3
      StrCpy $StateComponentSelected $3
    ${EndIf}
  ${Next}

  ${NSD_CreateGroupBox} 0 30u 90% 50u "$(LangComponentsOptional)"     

  ${NSD_CreateCheckBox} 12u 46u 140u 12u "$(LangComponentsAddons)"
  Pop $ComponentAddons
  ${If} $StateComponentAddons = ${BST_CHECKED}
    ${NSD_Check} $ComponentAddons
  ${EndIf}

  ${NSD_CreateCheckBox} 12u 62u 140u 12u "$(LangComponentsLegacyAddons)"
  Pop $ComponentLegacyAddons
  ${If} $StateComponentLegacyAddons = ${BST_CHECKED}
    ${NSD_Check} $ComponentLegacyAddons
  ${EndIf}

  ${NSD_CreateLabel} 12u 84u 85% 24u "$(LangComponentsOptionalExpl)"

  nsDialogs::Show
FunctionEnd

Function LeaveComponents
  ${NSD_GetState} $ComponentAddons $StateComponentAddons
  ${NSD_GetState} $ComponentLegacyAddons $StateComponentLegacyAddons

  ${NSD_GetText} $ComponentDialogSelection $9
  !insertmacro GetVersions $1
  ${ForEach} $2 1 $1 + 2
    Pop $3
    Pop $4
    ${If} $3 == $9
      StrCpy $StateComponentSelected $4
      ${Break}
    ${EndIf}
  ${Next}
FunctionEnd

; -------------------------------------------------------------------------------
; Backup schedule
; -------------------------------------------------------------------------------

; Backup - overall choice
Function CreateBackupSchedule
  !insertmacro "CheckUpgrade"
  !insertmacro CanScheduleTask $1
  ${IfNot} $1 == "1"
    Abort
  ${EndIf}
  !insertmacro MUI_HEADER_TEXT "$(LangBackupHeader1)" "$(LangBackupHeader2)"
  nsDialogs::Create 1018
  Pop $1
  ${If} $1 == error
		Abort
	${EndIf}  

  ${NSD_CreateCheckBox} 0u 0u 100% 12u "$(LangBackupDesc)"
  Pop $BackupEnabled
  ${NSD_OnClick} $BackupEnabled BackupEnabledClicked
  ${If} $StateBackupEnabled == ""
  ${OrIf} $StateBackupEnabled == ${BST_CHECKED}
    ${NSD_Check} $BackupEnabled
  ${EndIf}

  !insertmacro CreateFrequency ${BACKUP} $(LangWeekly) "18" 

  ${NSD_CreateLabel} 12u 32u 140u 12u "$(LangBackupMax)"
  Pop $BackupMaxFilesLabel

  ${NSD_CreateNumber} 155u 30u 50u 12u "30"
  Pop $BackupMaxFiles
  ${IfNot} $StateBackupMaxFiles == ""
    ${NSD_SetText} $BackupMaxFiles $StateBackupMaxFiles
  ${EndIf}

  !insertmacro "Is24OrGreater" $2 $StateComponentSelected
  ${If} $2 == "0"
    ${NSD_SetText} $BackupMaxFiles "0"
  ${EndIf}

  ${NSD_CreateLabel} 12u 50u 100% 12u "$(LangBackupSelect)"
  Pop $BackupTimeLabel
  !insertmacro TimeOptions ${BACKUP} "60"

  ${NSD_CreateLabel} 4u 120u 100% 12u "$(LangScheduleTaskMoreOptions)"
  Pop $BackupMoreOptionsLabel

  Call ValidateOverallBackupTime
  Call BackupEnabledClicked

  nsDialogs::Show
FunctionEnd

!insertmacro OverallEnabledClick ${BACKUP}
!insertmacro LeaveOverallSchedule ${BACKUP}
!insertmacro ValidateOverall ${BACKUP}
!insertmacro TimeOptionChange ${BACKUP}

; Backup - Daily options
Function CreateDailyBackupSchedule
  !insertmacro "CheckUpgrade"
  !insertmacro CanScheduleTask $1
  ${IfNot} $1 == "1"
    Abort
  ${EndIf}
  !insertmacro IsFreqEnabled ${BACKUP} $(LangDaily)

  !insertmacro MUI_HEADER_TEXT "$(LangBackupDailyHeader1)" "$(LangBackupDailyHeader2)"
  nsDialogs::Create 1018
  Pop $1
  ${If} $1 == error
		Abort
	${EndIf}  

  !insertmacro RecurDaysOptions ${BACKUP} "10"

  Call ValidateDailyBackupTime
  Call BackupTimeOptionChange
  nsDialogs::Show

FunctionEnd

!insertmacro ValidateDaily ${BACKUP}
!insertmacro LeaveDailySchedule ${BACKUP}

; Backup - Weekly options
Function CreateWeeklyBackupSchedule
  !insertmacro "CheckUpgrade"
  !insertmacro CanScheduleTask $1
  ${IfNot} $1 == "1"
    Abort
  ${EndIf}
  !insertmacro IsFreqEnabled ${BACKUP} $(LangWeekly)

  !insertmacro MUI_HEADER_TEXT "$(LangBackupWeeklyHeader1)" "$(LangBackupWeeklyHeader2)"
  nsDialogs::Create 1018
  Pop $1
  ${If} $1 == error
		Abort
	${EndIf}  

  !insertmacro DayOptions ${BACKUP} "12" "$(LangBackupWeeklySelect)"

  Call ValidateWeeklyBackupTime
  Call BackupTimeOptionChange
  nsDialogs::Show
FunctionEnd

!insertmacro ValidateWeekly ${BACKUP}
!insertmacro LeaveWeeklySchedule ${BACKUP}

; Backup - Monthly options
Function CreateMonthlyBackupSchedule
  !insertmacro "CheckUpgrade"
  !insertmacro CanScheduleTask $1
  ${IfNot} $1 == "1"
    Abort
  ${EndIf}
  !insertmacro IsFreqEnabled ${BACKUP} $(LangMonthly)
  !insertmacro MUI_HEADER_TEXT "$(LangBackupMonthlyHeader1)" "$(LangBackupMonthlyHeader2)"
  nsDialogs::Create 1018
  Pop $1
  ${If} $1 == error
		Abort
	${EndIf}  

  ${NSD_CreateLabel} 10u 12u 100% 12u "$(LangBackupMonthlySelect)"

  !insertmacro DayChoice ${BACKUP} "30"

  Call ValidateMonthlyBackupTime
  Call MonthlyBackupDayOptionChange
  Call BackupTimeOptionChange
  nsDialogs::Show
FunctionEnd

!insertmacro ValidateMonthly ${BACKUP}
!insertmacro DayOptionChange ${BACKUP}
!insertmacro LeaveMonthlySchedule ${BACKUP}

; -------------------------------------------------------------------------------
; Update schedule
; -------------------------------------------------------------------------------

; Update - overall choice
Function CreateUpdateSchedule
  !insertmacro "CheckUpgrade"
  !insertmacro CanScheduleTask $1
  ${IfNot} $1 == "1"
    Abort
  ${EndIf}
  
  !insertmacro MUI_HEADER_TEXT "$(LangUpdateHeader1)" "$(LangUpdateHeader2)"
  nsDialogs::Create 1018
  Pop $1
  ${If} $1 == error
		Abort
	${EndIf}  

  ${NSD_CreateCheckBox} 0u 0u 100% 12u "$(LangUpdateDesc)"
  Pop $UpdateEnabled
  ${NSD_OnClick} $UpdateEnabled UpdateEnabledClicked
  ${If} $StateUpdateEnabled == ""
  ${OrIf} $StateUpdateEnabled == ${BST_CHECKED}
    ${NSD_Check} $UpdateEnabled
  ${EndIf}

  ${StrLoc} $1 $StateComponentSelected "SNAPSHOT" ">"
  ${If} $1 == ""
    !insertmacro CreateFrequency ${UPDATE} $(LangMonthly) "40"
    ${NSD_CreateLabel} 12u 14u 80% 24u "$(LangUpdateStable)"
  ${Else}
    !insertmacro CreateFrequency ${UPDATE} $(LangWeekly) "40"
    ${NSD_CreateLabel} 12u 14u 80% 24u "$(LangUpdateSnapshot)"
  ${EndIf}

  ${NSD_CreateLabel} 12u 60u 100% 12u "$(LangUpdateTime)"
  Pop $UpdateTimeLabel
  !insertmacro TimeOptions ${UPDATE} "74"

  ${NSD_CreateLabel} 4u 125u 100% 12u "$(LangScheduleTaskMoreOptions)"
  Pop $UpdateMoreOptionsLabel

  Call ValidateOverallUpdateTime
  Call UpdateEnabledClicked

  nsDialogs::Show
FunctionEnd

!insertmacro OverallEnabledClick ${UPDATE}
!insertmacro LeaveOverallSchedule ${UPDATE}
!insertmacro ValidateOverall ${UPDATE}
!insertmacro TimeOptionChange ${UPDATE}

; Update - Daily options
Function CreateDailyUpdateSchedule
  !insertmacro "CheckUpgrade"
  !insertmacro CanScheduleTask $1
  ${IfNot} $1 == "1"
    Abort
  ${EndIf}

  !insertmacro IsFreqEnabled ${UPDATE} $(LangDaily)

  !insertmacro MUI_HEADER_TEXT "$(LangUpdateDailyHeader1)" "$(LangUpdateDailyHeader2)"
  nsDialogs::Create 1018
  Pop $1
  ${If} $1 == error
		Abort
	${EndIf}  

  !insertmacro RecurDaysOptions ${UPDATE} "10"

  Call ValidateDailyUpdateTime
  Call UpdateTimeOptionChange
  nsDialogs::Show

FunctionEnd
!insertmacro ValidateDaily ${UPDATE}
!insertmacro LeaveDailySchedule ${UPDATE}

; Update - Weekly options
Function CreateWeeklyUpdateSchedule
  !insertmacro "CheckUpgrade"
  !insertmacro CanScheduleTask $1
  ${IfNot} $1 == "1"
    Abort
  ${EndIf}
  !insertmacro IsFreqEnabled ${UPDATE} $(LangWeekly)

  !insertmacro MUI_HEADER_TEXT "$(LangUpdateWeeklyHeader1)" "$(LangUpdateWeeklyHeader2)"
  nsDialogs::Create 1018
  Pop $1
  ${If} $1 == error
		Abort
	${EndIf}  

  !insertmacro DayOptions ${UPDATE} "12" "$(LangUpdateWeeklySelect)"

  Call ValidateWeeklyUpdateTime
  Call UpdateTimeOptionChange
  nsDialogs::Show
FunctionEnd

!insertmacro ValidateWeekly ${UPDATE}
!insertmacro LeaveWeeklySchedule ${UPDATE}

; Update - Monthly options
Function CreateMonthlyUpdateSchedule
  !insertmacro "CheckUpgrade"
  !insertmacro CanScheduleTask $1
  ${IfNot} $1 == "1"
    Abort
  ${EndIf}
  !insertmacro IsFreqEnabled ${UPDATE} $(LangMonthly)
  !insertmacro MUI_HEADER_TEXT "$(LangUpdateMonthlyHeader1)" "$(LangUpdateMonthlyHeader2)"
  nsDialogs::Create 1018
  Pop $1
  ${If} $1 == error
		Abort
	${EndIf}  

  ${NSD_CreateLabel} 10u 12u 100% 12u "$(LangUpdateMonthlySelect)"

  !insertmacro DayChoice ${UPDATE} "30"

  Call ValidateMonthlyUpdateTime
  Call MonthlyUpdateDayOptionChange
  Call UpdateTimeOptionChange
  nsDialogs::Show

FunctionEnd

!insertmacro ValidateMonthly ${UPDATE}
!insertmacro DayOptionChange ${UPDATE}
!insertmacro LeaveMonthlySchedule ${UPDATE}

; -------------------------------------------------------------------------------
; Create service
; -------------------------------------------------------------------------------

Function CreateService
  !insertmacro "CheckUpgrade"
  !insertmacro MUI_HEADER_TEXT "$(LangServiceHeader1)" "$(LangServiceHeader2)"
  nsDialogs::Create 1018
  Pop $1
  ${If} $1 == error
		Abort
	${EndIf}  

  ${NSD_CreateCheckBox} 0u 0u 80% 50% "$(LangServiceDesc)"
  Pop $ServiceEnabled
  ${NSD_Check} $ServiceEnabled

  nsDialogs::Show
FunctionEnd

Function LeaveService
  ${NSD_GetState} $ServiceEnabled $StateCreateServiceEnabled
FunctionEnd

; -------------------------------------------------------------------------------
; onInit
; -------------------------------------------------------------------------------
Function .onInit
  !insertmacro MUI_LANGDLL_DISPLAY
  !insertmacro ReadSetupInfo
FunctionEnd

Function un.onInit
  !insertmacro ReadSetupInfo
FunctionEnd

Function .onInstSuccess
  !insertmacro WriteSetupInfo
FunctionEnd

Function LaunchOpenHAB
  SetOutPath $StateDirectoryHome
  ${If} $StateCreateServiceEnabled == ${BST_CHECKED}
    nsExec::Exec '"$StateDirectoryHome\${OPENHABSERVICEEXE}" start'
  ${Else}
    Exec 'cmd.exe /K "$StateDirectoryHome\start.bat"'
  ${EndIf}
  SetOutPath $instdir
FunctionEnd

Function LaunchPaperUI
  ExecShell open "http://localhost:8080"
FunctionEnd

Function CustomMUI
  ${If} $StateCreateServiceEnabled == ${BST_CHECKED}
    SendMessage $mui.FinishPage.Run.Text ${WM_SETTEXT} 0 "STR:Start openHAB Service"
  ${EndIf}
FunctionEnd

; -------------------------------------------------------------------------------
; The install code
; -------------------------------------------------------------------------------
Section "Install"
  ; -------------------------------------------------------------------------------
  ; Stop openHAB from running
  ; -------------------------------------------------------------------------------
  ; Try to stop openHAB using temp upgrade parms (if available)
  DetailPrint "$(LangLogCheckingService)"
  StrCpy $3 "0"
  ${If} ${FileExists} "$TempUpgradeHome"
  ${AndIf} ${FileExists} "$TempUpgradeRuntime"
    !insertmacro "StopOpenHAB" $4 "$TempUpgradeRuntime"
    ${If} $4 == "1"
      StrCpy $3 $4
    ${EndIf}
  ${EndIf}

  ; Try stop openHAB using selected directories if we didn't already stop stuff
  !insertmacro "StopOpenHAB" $4 "$StateDirectoryRuntime"
  ${If} $4 == "1"
    StrCpy $3 $4
  ${EndIf}

  ; -------------------------------------------------------------------------------
  ; Handle upgrade options
  ; -------------------------------------------------------------------------------
  ; Handle update/uninstall - delete/do nothing is essentially the same
  ${If} $TempUpgradeOption == ${UPGRADEOPTION_UPDATE}
    ${If} ${FileExists} "$TempUpgradeRuntime\bin\update.ps1"
      SetOutPath  "$TempUpgradeHome"
      DetailPrint "$(LangLogCallingUpdate)"
      ExecWait "cmd /K powershell.exe -ExecutionPolicy Bypass -command $\"&{ . '$TempUpgradeRuntime\bin\update.ps1';Update-openHAB -OHVersion '$StateComponentSelected' }$\""
      ${IfNot} $3 == "1"
        Abort "$(LangLogCallingUpdateDone)"
      ${EndIf}
      Goto InstallDone
    ${Else}
      Abort "$(LangAbortUpgradeUpdateBad)"   
    ${EndIf}
  ${ElseIf} $TempUpgradeOption == ${UPGRADEOPTION_UNINSTALL}    
    ${If} ${FileExists} "$TempUpgradeHome\${OPENHABUNINSTALLER}"
      DetailPrint "$(LangLogCallingUninstaller)"
      ExecWait '"$TempUpgradeHome\${OPENHABUNINSTALLER}" _?=$INSTDIR'
    ${Else}
      Abort "$(LangAbortUpgradeUninstallBad)"   
    ${EndIf}
  ${ElseIf} $TempUpgradeOption == ${UPGRADEOPTION_DELETE}
    !insertmacro DeleteOpenHAB $TempUpgradeHome $TempUpgradeAddons $TempUpgradeBackup $TempUpgradeConf $TempUpgradeRuntime $TempUpgradeUserData
  ${EndIf}

  ; ------------------------------------------------
  ; Check java version
  ; ------------------------------------------------
  DetailPrint "$(LangLogCheckJava)"   

  Call GetJavaVersion
  pop $0 ; major version
  pop $1 ; minor version
  pop $2 ; micro version
  pop $3 ; build/update version

  Strcmp $0 "no" VersionFailure
  IntCmp $0 1 +1 VersionFailure VersionOk
  IntCmp $1 8 VersionOk VersionFailure VersionOk

  VersionFailure:
    Abort "$(LangLogJavaFailed)"

  VersionOk: 
    ClearErrors

  ; ------------------------------------------------
  ; Create the home directory
  ; ------------------------------------------------
  ${If} ${FileExists} "$StateDirectoryHome"
    RMDir /r "$StateDirectoryHome"
  ${EndIf}
  CreateDirectory "$StateDirectoryHome"

  ; ------------------------------------------------
  ; Download the distribution and addons
  ; ------------------------------------------------
  ${StrLoc} $1 $StateComponentSelected "SNAPSHOT" ">"
  ${If} $1 == ""
      StrCpy $2 "https://bintray.com/openhab/mvn/download_file?file_path=org%2Fopenhab%2Fdistro%2Fopenhab%2F$StateComponentSelected%2Fopenhab-$StateComponentSelected.zip"
      StrCpy $3 "https://bintray.com/openhab/mvn/download_file?file_path=org%2Fopenhab%2Fdistro%2Fopenhab-addons%2F$StateComponentSelected%2Fopenhab-addons-$StateComponentSelected.kar"
      StrCpy $4 "https://bintray.com/openhab/mvn/download_file?file_path=org%2Fopenhab%2Fdistro%2Fopenhab-addons-legacy%2F$StateComponentSelected%2Fopenhab-addons-legacy-$StateComponentSelected.kar"
  ${Else}
      StrCpy $2 "https://ci.openhab.org/job/openHAB-Distribution/lastSuccessfulBuild/artifact/distributions/openhab/target/openhab-$StateComponentSelected.zip"
      StrCpy $3 "https://ci.openhab.org/job/openHAB-Distribution/lastSuccessfulBuild/artifact/distributions/openhab-addons/target/openhab-addons-$StateComponentSelected.kar"
      StrCpy $4 "https://ci.openhab.org/job/openHAB-Distribution/lastSuccessfulBuild/artifact/distributions/openhab-addons-legacy/target/openhab-addons-legacy-$StateComponentSelected.kar"
  ${EndIf}

  StrCpy $FileDistribution "$StateDirectoryHome\openhab-$StateComponentSelected.zip"
  DetailPrint "$(LangLogDownloading1) $2 $(LangLogDownloading2) $FileDistribution"   

  inetc::get $2 "$FileDistribution" /end
  Pop $6
  ${IfNot} $6 == "ok"
    Abort "$(LangLogDownloadingAborted) $6"
  ${EndIf}

  ${If} $StateComponentAddons == ${BST_CHECKED}
    StrCpy $FileAddons "$StateDirectoryHome\openhab-addons-$StateComponentSelected.zip"

    DetailPrint "$(LangLogDownloadingAddons1) $3 $(LangLogDownloading2) $FileAddons"   

    inetc::get $3 "$FileAddons" /end
    Pop $6
    ${IfNot} $6 == "ok"
      Abort "$(LangLogDownloadingAddonsAborted) $6"
    ${EndIf}
  ${EndIf}

  ${If} $StateComponentLegacyAddons == ${BST_CHECKED}
    StrCpy $FileLegacyAddons "$StateDirectoryHome\openhab-addons-legacy-$StateComponentSelected.zip"

    DetailPrint "$(LangLogDownloadingLegacyAddons1) $3 $(LangLogDownloadingAddons2) $FileLegacyAddons"   

    inetc::get $3 "$FileLegacyAddons" /end
    Pop $6
    ${IfNot} $6 == "ok"
      Abort "$(LangLogDownloadingLegacyAddonsAborted) $6"
    ${EndIf}
  ${EndIf}

  ; ------------------------------------------------
  ; Expand the distribution to the home directory
  ; ------------------------------------------------
  DetailPrint "$(LangLogExpandingDistribution1) $FileDistribution $(LangLogExpandingDistribution2) $StateDirectoryHome"   

  ZipDLL::extractall "$FileDistribution" "$StateDirectoryHome"
  Pop $6
  ${IfNot} $6 == "success"
    Abort "$(LangLogExpandingDistributionAborted) $6"
  ${EndIf}

  Delete "$FileDistribution"
  
  ; ------------------------------------------------
  ; Move the distribution to advanced folders
  ; ------------------------------------------------
  ;!insertmacro Locate

  ${IfNot} $FileAddons == ""
    DetailPrint "$(LangLogMoving1) $FileAddons $(LangLogMoving3) $StateComponentAddons"   
    ${If} ${FileExists} "$StateComponentAddons\openhab-addons-$StateComponentSelected.zip"
      Delete "$StateComponentAddons\openhab-addons-$StateComponentSelected.zip"
    ${EndIf}
    !insertmacro MoveFile $FileAddons "$StateComponentAddons\openhab-addons-$StateComponentSelected.zip"
  ${EndIf}

  ${IfNot} $FileLegacyAddons == ""
    DetailPrint "$(LangLogMoving1) $FileLegacyAddons $(LangLogMoving3) $StateComponentAddons"   
    ${If} ${FileExists} "$StateComponentAddons\openhab-addons-legacy-$StateComponentSelected.zip"
      Delete "$StateComponentAddons\openhab-addons-legacy-$StateComponentSelected.zip"
    ${EndIf}
    !insertmacro MoveFile $FileLegacyAddons "$StateComponentAddons\openhab-addons-legacy-$StateComponentSelected.zip"
  ${EndIf}

  ${IfNot} $StateDirectoryAddons == "$StateDirectoryHome\addons"
    DetailPrint "$(LangLogMoving1) $(LangSelectDirectoriesAddons) $(LangLogMoving2) $StateDirectoryHome\addons $(LangLogMoving3) $StateDirectoryAddons"   
    ${If} ${FileExists} "$StateDirectoryAddons"
      RMDir /r "$StateDirectoryAddons"
    ${EndIf}
    !insertmacro MoveFolder "$StateDirectoryHome\addons\" "$StateDirectoryAddons" "*.*"
  ${EndIf}  

  ${IfNot} $StateDirectoryConf == "$StateDirectoryHome\conf"
    DetailPrint "$(LangLogMoving1) $(LangSelectDirectoriesConf) $(LangLogMoving2) $StateDirectoryHome\conf $(LangLogMoving3) $StateDirectoryConf"   
    ${If} ${FileExists} "$StateDirectoryConf"
      RMDir /r "$StateDirectoryConf"
    ${EndIf}
    !insertmacro MoveFolder "$StateDirectoryHome\conf\" "$StateDirectoryConf" "*.*"
  ${EndIf}  

  ${IfNot} $StateDirectoryRuntime == "$StateDirectoryHome\runtime"
    DetailPrint "$(LangLogMoving1) $(LangSelectDirectoriesRuntime) $(LangLogMoving2) $StateDirectoryHome\runtime $(LangLogMoving3) $StateDirectoryRuntime"   
    ${If} ${FileExists} "$StateDirectoryRuntime"
      RMDir /r "$StateDirectoryRuntime"
    ${EndIf}
    !insertmacro MoveFolder "$StateDirectoryHome\runtime\" "$StateDirectoryRuntime" "*.*"
  ${EndIf}  

  ${IfNot} $StateDirectoryUserData == "$StateDirectoryHome\userdata"
    DetailPrint "$(LangLogMoving1) $(LangSelectDirectoriesUserData) $(LangLogMoving2) $StateDirectoryHome\userdata $(LangLogMoving3) $StateDirectoryUserData"   
    ${If} ${FileExists} "$StateDirectoryUserData"
      RMDir /r "$StateDirectoryUserData"
    ${EndIf}
    !insertmacro MoveFolder "$StateDirectoryHome\userdata\" "$StateDirectoryUserData" "*.*"
  ${EndIf} 

  ; ------------------------------------------------
  ; Create the backups directory
  ; ------------------------------------------------
  ${IfNot} ${FileExists} "$StateDirectoryBackups"
    DetailPrint "$(LangLogCreateBackupDirectory)"
    CreateDirectory $StateDirectoryBackups
  ${EndIf}

  ; ------------------------------------------------
  ; Set the environment variables
  ; ------------------------------------------------
  EnVar::SetHKLM

  !insertmacro DeleteEnvironmentVariables

  ${If} $StateDirectoryAdvanced == ${BST_CHECKED}
    DetailPrint "$(LangLogDefiningEnvironmentVariable1) OPENHAB_ADDONS $(LangLogDefiningEnvironmentVariable2)"
    !insertmacro SetEnvVar "OPENHAB_ADDONS" "$StateDirectoryAddons"
    Pop $1
    ${IfNot} $1 == "0"
      Abort "$(LangLogCouldNotDefineEnvironmentVariable1) OPENHAB_ADDONS $(LangLogCouldNotDefineEnvironmentVariable2) $1"
    ${EndIf}

    DetailPrint "$(LangLogDefiningEnvironmentVariable1) OPENHAB_BACKUPS $(LangLogDefiningEnvironmentVariable2)"
    !insertmacro SetEnvVar "OPENHAB_BACKUPS" "$StateDirectoryBackups"
    Pop $1
    ${IfNot} $1 == "0"
      Abort "$(LangLogCouldNotDefineEnvironmentVariable1) OPENHAB_BACKUPS $(LangLogCouldNotDefineEnvironmentVariable2) $1"
    ${EndIf}

    DetailPrint "$(LangLogDefiningEnvironmentVariable1) OPENHAB_CONF $(LangLogDefiningEnvironmentVariable2)"
    !insertmacro SetEnvVar "OPENHAB_CONF" "$StateDirectoryConf"
    Pop $1
    ${IfNot} $1 == "0"
      Abort "$(LangLogCouldNotDefineEnvironmentVariable1) OPENHAB_CONF $(LangLogCouldNotDefineEnvironmentVariable2) $1"
    ${EndIf}

    DetailPrint "$(LangLogDefiningEnvironmentVariable1) OPENHAB_RUNTIME $(LangLogDefiningEnvironmentVariable2)"
    !insertmacro SetEnvVar "OPENHAB_RUNTIME" "$StateDirectoryRuntime"
    Pop $1
    ${IfNot} $1 == "0"
      Abort "$(LangLogCouldNotDefineEnvironmentVariable1) OPENHAB_RUNTIME $(LangLogCouldNotDefineEnvironmentVariable2) $1"
    ${EndIf}

    DetailPrint "$(LangLogDefiningEnvironmentVariable1) OPENHAB_USERDATA $(LangLogDefiningEnvironmentVariable2)"
    !insertmacro SetEnvVar "OPENHAB_USERDATA" "$StateDirectoryUserData"
    Pop $1
    ${IfNot} $1 == "0"
      Abort "$(LangLogCouldNotDefineEnvironmentVariable1) OPENHAB_USERDATA $(LangLogCouldNotDefineEnvironmentVariable2) $1"
    ${EndIf}
  ${EndIF}

  DetailPrint "$(LangLogDefiningEnvironmentVariable1) OPENHAB_HOME $(LangLogDefiningEnvironmentVariable2)"
  !insertmacro SetEnvVar "OPENHAB_HOME" "$StateDirectoryHome"
  Pop $1
  ${IfNot} $1 == "0"
    Abort "$(LangLogCouldNotDefineEnvironmentVariable1) OPENHAB_HOME $(LangLogCouldNotDefineEnvironmentVariable2) $1"
  ${EndIf}

  DetailPrint "$(LangLogCheckingJavaHome1) JAVA_HOME $(LangLogCheckingJavaHome2)"     
  ReadEnvStr $1 "JAVA_HOME"
  ${If} $1 == ""
    Call GetJavaPath
    Pop $1
    ${If} $1 == ""
      # this really shouldn't happen since we ensured java was installed in a prior section
      Abort "$(LangLogReinstallJava1) JAVA_HOME $(LangLogReinstallJava2) "
    ${Else}
      DetailPrint "$(LangLogDefiningJavaHome) JAVA_HOME"     
      !insertmacro SetEnvVar "JAVA_HOME" "$1"
      Pop $1
      ${IfNot} $1 == "0"
        Abort "$(LangLogCouldNotDefineJavaHome1) JAVA_HOME $(LangLogCouldNotDefineJavaHome2) $1"
      ${EndIf}
    ${EndIf}
  ${EndIf}
  ; Fix for installer process not seeing java_home variable
  System::Call 'Kernel32::SetEnvironmentVariable(t, t)i ("JAVA_HOME", "$1").r0'


  ; ------------------------------------------------
  ; Create the tasks
  ; ------------------------------------------------
  ; follow registers shouldn't class with CreateScheduledTask (or we should modify that to save/restore state)
  ${If} $StateUpdateEnabled == ${BST_CHECKED}
    StrCpy $R6 "update-openhab"
    StrCpy $R7 "$(LangTaskUpdateDesc)"
    !insertmacro CreateScheduledTask "${UPDATE}" "$(LangTaskUpdateName)" "update.ps1" $R6 $R7
  ${EndIf}

  ${If} $StateBackupEnabled == ${BST_CHECKED}
    StrCpy $R6 "backup-openhab"
    IntCmp $StateBackupMaxFiles 0 +2 +2 +1
    StrCpy $R6 "$R6 -MaxFiles $StateBackupMaxFiles"
    StrCpy $R7 "$(LangTaskBackupDesc)"
    !insertmacro CreateScheduledTask "${BACKUP}" "$(LangTaskBackupName)" "backup.ps1" $R6 $R7
  ${EndIf}

  ; ------------------------------------------------
  ; Create the service
  ; ------------------------------------------------
  ${If} $StateCreateServiceEnabled == ${BST_CHECKED}
    DetailPrint "$(LangLogCreateService)"

    ; modify the template
    ${StrRep} $R9 "${SERVICETEMPLATE}" "$$OPENHAB_HOME" "$StateDirectoryHome"
    ${StrRep} $R9 $R9 "$$OPENHAB_RUNTIME" "$StateDirectoryRuntime"
    ${StrRep} $R9 $R9 "$$OPENHAB_USERDATA" "$StateDirectoryUserData"
    ${StrRep} $R9 $R9 "$$VERSION" "$StateComponentSelected"
    ${StrRep} $R9 $R9 "$$SERVICEID" "${OPENHABSERVICEID}"
    ${StrRep} $R9 $R9 "$$LANG_SERVICENAME" "$(LangServiceName)"
    ${StrRep} $R9 $R9 "$$LANG_SERVICEDESC" "$(LangServiceDesc)"

    SetOutPath "$INSTDIR"
    SetOverwrite ifnewer
    File "..\Service\${OPENHABSERVICEEXE}"

    ; write it out (openHAB-service.xml must match the openHAB-service.exe)
    StrCpy $3 "$StateDirectoryHome\${OPENHABSERVICEXML}"
    ClearErrors
    FileOpen $4 $3 w
    ${If} ${Errors}
      Abort "$(LangServiceErrorOpeningFile1) '$3' $(LangServiceErrorOpeningFile2)"
    ${EndIf}

    FileWrite $4 $R9
    ${If} ${Errors}
      Abort "$(LangServiceErrorWritingFile) '$3'"
    ${EndIf}

    FileClose $4
    ${If} ${Errors}
      Abort "$(LangServiceErrorClosingFile) '$3'"
    ${EndIf}

    !insertmacro "DeleteService" "$StateDirectoryHome"
    nsExec::ExecToLog '"$StateDirectoryHome\${OPENHABSERVICEEXE}" install'
    ; haven't figured out the return codes yet
  ${EndIf}

  ; ------------------------------------------------
  ; Create the uninstaller
  ; ------------------------------------------------
  StrCpy $2 "$StateDirectoryHome\${OPENHABUNINSTALLER}"
  WriteUninstaller $2

  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\openHAB" "DisplayName" "$(LangUninstallDisplayName) $StateComponentSelected"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\openHAB" "UninstallString" "$\"$2$\""
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\openHAB" "QuietUninstallString" "$\"$2$\" /S"
  WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\openHAB" "NoModify" 1
  WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\openHAB" "NoRepair" 1

  ${If} $StateDirectoryAdvanced == ${BST_CHECKED}
    ${Locate::GetSize} "$StateDirectoryHome" "/S=0K" $0 $1 $2
    IntFmt $0 "0x%08X" $0
  ${Else}
    ${Locate::GetSize} "$StateDirectoryAddons" "/S=0K" $R0 $1 $2
    ${Locate::GetSize} "$StateDirectoryConf" "/S=0K" $R1 $1 $2
    ${Locate::GetSize} "$StateDirectoryUserData" "/S=0K" $R2 $1 $2
    ${Locate::GetSize} "$StateDirectoryRuntime" "/S=0K" $R3 $1 $2
    ; don't include home - may include the above and there is very little in home
    IntOp $R4 $R0 + $R1
    IntOp $R4 $R4 + $R2
    IntOp $R4 $R4 + $R3
    IntFmt $0 "0x%08X" $R4
  ${EndIf}
  ${Locate::Unload}

  WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\openHAB" "EstimatedSize" $0
  
  DetailPrint "$(LangLogSuccessfullyInstalled)"

  InstallDone:
SectionEnd

Section "Uninstall"
  !insertmacro "StopOpenHAB" $1 "${RunTime}"
  !insertmacro "DeleteOpenHAB" $StateDirectoryHome $StateDirectoryAddons $StateDirectoryBackups $StateDirectoryConf $StateDirectoryRuntime $StateDirectoryUserData
  DetailPrint "$(LangLogSuccessfullyUninstalled)"
SectionEnd