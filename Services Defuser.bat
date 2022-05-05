@echo off

:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------

color a

NET STOP TabletInputService
sc config TabletInputService start= disabled

NET STOP W32Time
sc config W32Time start= disabled

NET STOP seclogon
sc config seclogon start= disabled

NET STOP Fax
sc config Fax start= disabled

NET STOP RemoteAccess
sc config RemoteAccess start= disabled

NET STOP bthserv
sc config bthserv start= disabled

NET STOP CertPropSvc
sc config CertPropSvc start= disabled

NET STOP MSiSCSI
sc config MSiSCSI start= disabled

NET STOP WpcMonSvc
sc config WpcMonSvc start= disabled

NET STOP wcncsvc
sc config wcncsvc start= disabled

NET STOP WerSvc
sc config WerSvc start= disabled

NET STOP AarSvc_b714a
sc config AarSvc_b714a start= disabled

NET STOP BTAGService
sc config BTAGService start= disabled

NET STOP bthserv
sc config bthserv start= disabled

NET STOP BluetoothUserService_b714a
sc config BluetoothUserService_b714a start= disabled

NET STOP DiagTrack
sc config DiagTrack start= disabled

NET STOP PimIndexMaintenanceSvc_b714a
sc config PimIndexMaintenanceSvc_b714a start= disabled

NET STOP MapsBroker
sc config MapsBroker start= disabled

NET STOP icssvc
sc config icssvc start= disabled

NET STOP wisvc
sc config wisvc start= disabled

NET STOP CscService
sc config CscService start= disabled

NET STOP RemoteRegistry
sc config RemoteRegistry start= disabled

NET STOP ALG
sc config ALG start= disabled

NET STOP RetailDemo
sc config RetailDemo start= disabled

NET STOP lfsvc
sc config lfsvc start= disabled

NET STOP WbioSrvc
sc config WbioSrvc start= disabled

NET STOP EntAppSvc
sc config EntAppSvc start= disabled

NET STOP HpTouchpointAnalyticsService
sc config HpTouchpointAnalyticsService start= disabled

NET STOP HPAppHelperCap
sc config HPAppHelperCap start= disabled

NET STOP HPDiagsCap
sc config HPDiagsCap start= disabled

NET STOP SysMain
sc config SysMain start= disabled

NET STOP Themes
sc config Themes start= disabled

NET STOP SDRSVC
sc config SDRSVC start= disabled

cls
color d

echo ==================[Ziac Services]==================
echo Unneccessary Windows Services Has Been Stopped
echo Please Make Sure To Run As Administrator
echo Batch File Made by TadaMacky
echo Discord Server: https://discord.gg/zYrG7sK2
echo ===================================================

SET /P yesno=Do you want to Reboot this machine? [Y/N]:
    IF "%yesno%"=="y" GOTO Confirmation
    IF "%yesno%"=="Y" GOTO Confirmation
    IF "%yesno%"=="n" GOTO End
    IF "%yesno%"=="N" GOTO End
    
    :Confirmation
    
    ECHO System is going to Reboot now
    
    shutdown.exe /r 
    
    GOTO EOF
    :End
    
    ECHO System Reboot cancelled
    pause