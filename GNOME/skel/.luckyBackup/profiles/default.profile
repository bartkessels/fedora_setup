***************************** WARNING *****************************
Do NOT edit this file directly, unless you REALLY know what you are doing !!


[profile_global]
appName=luckyBackup
appVersion=0.49
TotalTasks=11

[email]
emailCommand=
emailArguments=
emailSubject=luckyBackup report
emailNever=1
emailError=0
emailSchedule=0
emailTLS=0
emailFrom=
emailTo=
emailSMTP=
emailBody=Profile:      %p
emailBody=Date:         %d
emailBody=Time:         %i
emailBody=Errors found: %e

[Task] - 0
Name=Afbeeldingen
TypeDirContents=0
TypeDirName=1
TypeSync=0
Source=/home/bkessels/bk-cloud/Afbeeldingen
Destination=/run/media/bkessels/USB Bart/
LastExecutionTime=20171214215520
LastExecutionErrors=0
Args=-h
Args=--progress
Args=--stats
Args=-r
Args=-tgo
Args=-p
Args=-l
Args=-D
Args=--update
Args=--filter=protect .luckybackup-snaphots/
Args=/home/bkessels/bk-cloud/Afbeeldingen
Args=/run/media/bkessels/USB Bart/
ConnectRestore=
KeepSnapshots=1
SnapshotsListItem=20171214215520
Exclude=0
ExcludeFromFile=0
ExcludeFile=
ExcludeTemp=0
ExcludeCache=0
ExcludeBackup=0
ExcludeMount=0
ExcludeLostFound=0
ExcludeSystem=0
ExcludeTrash=0
ExcludeGVFS=0
Include=0
IncludeFromFile=0
IncludeModeNormal=1
IncludeFile=
Remote=0
RemoteModule=0
RemoteDestination=1
RemoteSource=0
RemoteSSH=0
RemoteHost=
RemoteUser=
RemotePassword=
RemoteSSHPassword=
RemoteSSHPasswordStr=
RemoteSSHOptions=
RemoteSSHPort=0
OptionsUpdate=1
OptionsDelete=0
OptionsRecurse=1
OptionsOwnership=1
OptionsSymlinks=1
OptionsPermissions=1
OptionsDevices=1
OptionsCVS=0
OptionsHardLinks=0
OptionsFATntfs=0
OptionsSuper=0
OptionsNumericIDs=0
OptionsRestorent=0
OptionsVss=0
LuckyBackupDir=/home/bkessels/.luckyBackup/
VshadowDir=/usr/bin
RsyncCommand=rsync
SshCommand=ssh
DosdevCommand=/usr/bin/dosdev.exe
CygpathCommand=/usr/bin/cygpath.exe
TempPath=/tmp
ByPassWarning=0
CloneWarning=1
RepeatOnFail=0
IncludeState=1
[Task_end] - 0

[Task] - 1
Name=Backups
TypeDirContents=0
TypeDirName=1
TypeSync=0
Source=/home/bkessels/bk-cloud/Backups
Destination=/run/media/bkessels/USB Bart/
LastExecutionTime=20171214215520
LastExecutionErrors=0
Args=-h
Args=--progress
Args=--stats
Args=-r
Args=-tgo
Args=-p
Args=-l
Args=-D
Args=--update
Args=--filter=protect .luckybackup-snaphots/
Args=/home/bkessels/bk-cloud/Backups
Args=/run/media/bkessels/USB Bart/
ConnectRestore=
KeepSnapshots=1
SnapshotsListItem=20171214215520
Exclude=0
ExcludeFromFile=0
ExcludeFile=
ExcludeTemp=0
ExcludeCache=0
ExcludeBackup=0
ExcludeMount=0
ExcludeLostFound=0
ExcludeSystem=0
ExcludeTrash=0
ExcludeGVFS=0
Include=0
IncludeFromFile=0
IncludeModeNormal=1
IncludeFile=
Remote=0
RemoteModule=0
RemoteDestination=1
RemoteSource=0
RemoteSSH=0
RemoteHost=
RemoteUser=
RemotePassword=
RemoteSSHPassword=
RemoteSSHPasswordStr=
RemoteSSHOptions=
RemoteSSHPort=0
OptionsUpdate=1
OptionsDelete=0
OptionsRecurse=1
OptionsOwnership=1
OptionsSymlinks=1
OptionsPermissions=1
OptionsDevices=1
OptionsCVS=0
OptionsHardLinks=0
OptionsFATntfs=0
OptionsSuper=0
OptionsNumericIDs=0
OptionsRestorent=0
OptionsVss=0
LuckyBackupDir=/home/bkessels/.luckyBackup/
VshadowDir=/usr/bin
RsyncCommand=rsync
SshCommand=ssh
DosdevCommand=/usr/bin/dosdev.exe
CygpathCommand=/usr/bin/cygpath.exe
TempPath=/tmp
ByPassWarning=0
CloneWarning=1
RepeatOnFail=0
IncludeState=1
[Task_end] - 1

[Task] - 2
Name=Boeken
TypeDirContents=0
TypeDirName=1
TypeSync=0
Source=/home/bkessels/bk-cloud/Boeken
Destination=/run/media/bkessels/USB Bart/
LastExecutionTime=20171214215520
LastExecutionErrors=0
Args=-h
Args=--progress
Args=--stats
Args=-r
Args=-tgo
Args=-p
Args=-l
Args=-D
Args=--update
Args=--filter=protect .luckybackup-snaphots/
Args=/home/bkessels/bk-cloud/Boeken
Args=/run/media/bkessels/USB Bart/
ConnectRestore=
KeepSnapshots=1
SnapshotsListItem=20171214215520
Exclude=0
ExcludeFromFile=0
ExcludeFile=
ExcludeTemp=0
ExcludeCache=0
ExcludeBackup=0
ExcludeMount=0
ExcludeLostFound=0
ExcludeSystem=0
ExcludeTrash=0
ExcludeGVFS=0
Include=0
IncludeFromFile=0
IncludeModeNormal=1
IncludeFile=
Remote=0
RemoteModule=0
RemoteDestination=1
RemoteSource=0
RemoteSSH=0
RemoteHost=
RemoteUser=
RemotePassword=
RemoteSSHPassword=
RemoteSSHPasswordStr=
RemoteSSHOptions=
RemoteSSHPort=0
OptionsUpdate=1
OptionsDelete=0
OptionsRecurse=1
OptionsOwnership=1
OptionsSymlinks=1
OptionsPermissions=1
OptionsDevices=1
OptionsCVS=0
OptionsHardLinks=0
OptionsFATntfs=0
OptionsSuper=0
OptionsNumericIDs=0
OptionsRestorent=0
OptionsVss=0
LuckyBackupDir=/home/bkessels/.luckyBackup/
VshadowDir=/usr/bin
RsyncCommand=rsync
SshCommand=ssh
DosdevCommand=/usr/bin/dosdev.exe
CygpathCommand=/usr/bin/cygpath.exe
TempPath=/tmp
ByPassWarning=0
CloneWarning=1
RepeatOnFail=0
IncludeState=1
[Task_end] - 2

[Task] - 3
Name=Documenten
TypeDirContents=0
TypeDirName=1
TypeSync=0
Source=/home/bkessels/bk-cloud/Documenten
Destination=/run/media/bkessels/USB Bart/
LastExecutionTime=20171214215522
LastExecutionErrors=0
Args=-h
Args=--progress
Args=--stats
Args=-r
Args=-tgo
Args=-p
Args=-l
Args=-D
Args=--update
Args=--filter=protect .luckybackup-snaphots/
Args=/home/bkessels/bk-cloud/Documenten
Args=/run/media/bkessels/USB Bart/
ConnectRestore=
KeepSnapshots=1
SnapshotsListItem=20171214215522
Exclude=0
ExcludeFromFile=0
ExcludeFile=
ExcludeTemp=0
ExcludeCache=0
ExcludeBackup=0
ExcludeMount=0
ExcludeLostFound=0
ExcludeSystem=0
ExcludeTrash=0
ExcludeGVFS=0
Include=0
IncludeFromFile=0
IncludeModeNormal=1
IncludeFile=
Remote=0
RemoteModule=0
RemoteDestination=1
RemoteSource=0
RemoteSSH=0
RemoteHost=
RemoteUser=
RemotePassword=
RemoteSSHPassword=
RemoteSSHPasswordStr=
RemoteSSHOptions=
RemoteSSHPort=0
OptionsUpdate=1
OptionsDelete=0
OptionsRecurse=1
OptionsOwnership=1
OptionsSymlinks=1
OptionsPermissions=1
OptionsDevices=1
OptionsCVS=0
OptionsHardLinks=0
OptionsFATntfs=0
OptionsSuper=0
OptionsNumericIDs=0
OptionsRestorent=0
OptionsVss=0
LuckyBackupDir=/home/bkessels/.luckyBackup/
VshadowDir=/usr/bin
RsyncCommand=rsync
SshCommand=ssh
DosdevCommand=/usr/bin/dosdev.exe
CygpathCommand=/usr/bin/cygpath.exe
TempPath=/tmp
ByPassWarning=0
CloneWarning=1
RepeatOnFail=0
IncludeState=1
[Task_end] - 3

[Task] - 4
Name=Muziek (eigen)
TypeDirContents=0
TypeDirName=1
TypeSync=0
Source=/home/bkessels/bk-cloud/Muziek/Eigen
Destination=/run/media/bkessels/USB Bart/
LastExecutionTime=20171214215523
LastExecutionErrors=0
Args=-h
Args=--progress
Args=--stats
Args=-r
Args=-tgo
Args=-p
Args=-l
Args=-D
Args=--update
Args=--filter=protect .luckybackup-snaphots/
Args=/home/bkessels/bk-cloud/Muziek/Eigen
Args=/run/media/bkessels/USB Bart/
ConnectRestore=
KeepSnapshots=1
SnapshotsListItem=20171214215523
Exclude=0
ExcludeFromFile=0
ExcludeFile=
ExcludeTemp=0
ExcludeCache=0
ExcludeBackup=0
ExcludeMount=0
ExcludeLostFound=0
ExcludeSystem=0
ExcludeTrash=0
ExcludeGVFS=0
Include=0
IncludeFromFile=0
IncludeModeNormal=1
IncludeFile=
Remote=0
RemoteModule=0
RemoteDestination=1
RemoteSource=0
RemoteSSH=0
RemoteHost=
RemoteUser=
RemotePassword=
RemoteSSHPassword=
RemoteSSHPasswordStr=
RemoteSSHOptions=
RemoteSSHPort=0
OptionsUpdate=1
OptionsDelete=0
OptionsRecurse=1
OptionsOwnership=1
OptionsSymlinks=1
OptionsPermissions=1
OptionsDevices=1
OptionsCVS=0
OptionsHardLinks=0
OptionsFATntfs=0
OptionsSuper=0
OptionsNumericIDs=0
OptionsRestorent=0
OptionsVss=0
LuckyBackupDir=/home/bkessels/.luckyBackup/
VshadowDir=/usr/bin
RsyncCommand=rsync
SshCommand=ssh
DosdevCommand=/usr/bin/dosdev.exe
CygpathCommand=/usr/bin/cygpath.exe
TempPath=/tmp
ByPassWarning=0
CloneWarning=1
RepeatOnFail=0
IncludeState=1
[Task_end] - 4

[Task] - 5
Name=Notities
TypeDirContents=0
TypeDirName=1
TypeSync=0
Source=/home/bkessels/bk-cloud/Notities
Destination=/run/media/bkessels/USB Bart/
LastExecutionTime=20171214215523
LastExecutionErrors=0
Args=-h
Args=--progress
Args=--stats
Args=-r
Args=-tgo
Args=-p
Args=-l
Args=-D
Args=--update
Args=--filter=protect .luckybackup-snaphots/
Args=/home/bkessels/bk-cloud/Notities
Args=/run/media/bkessels/USB Bart/
ConnectRestore=
KeepSnapshots=1
SnapshotsListItem=20171214215523
Exclude=0
ExcludeFromFile=0
ExcludeFile=
ExcludeTemp=0
ExcludeCache=0
ExcludeBackup=0
ExcludeMount=0
ExcludeLostFound=0
ExcludeSystem=0
ExcludeTrash=0
ExcludeGVFS=0
Include=0
IncludeFromFile=0
IncludeModeNormal=1
IncludeFile=
Remote=0
RemoteModule=0
RemoteDestination=1
RemoteSource=0
RemoteSSH=0
RemoteHost=
RemoteUser=
RemotePassword=
RemoteSSHPassword=
RemoteSSHPasswordStr=
RemoteSSHOptions=
RemoteSSHPort=0
OptionsUpdate=1
OptionsDelete=0
OptionsRecurse=1
OptionsOwnership=1
OptionsSymlinks=1
OptionsPermissions=1
OptionsDevices=1
OptionsCVS=0
OptionsHardLinks=0
OptionsFATntfs=0
OptionsSuper=0
OptionsNumericIDs=0
OptionsRestorent=0
OptionsVss=0
LuckyBackupDir=/home/bkessels/.luckyBackup/
VshadowDir=/usr/bin
RsyncCommand=rsync
SshCommand=ssh
DosdevCommand=/usr/bin/dosdev.exe
CygpathCommand=/usr/bin/cygpath.exe
TempPath=/tmp
ByPassWarning=0
CloneWarning=1
RepeatOnFail=0
IncludeState=1
[Task_end] - 5

[Task] - 6
Name=School
TypeDirContents=0
TypeDirName=1
TypeSync=0
Source=/home/bkessels/bk-cloud/School
Destination=/run/media/bkessels/USB Bart/
LastExecutionTime=20171214215523
LastExecutionErrors=0
Args=-h
Args=--progress
Args=--stats
Args=-r
Args=-tgo
Args=-p
Args=-l
Args=-D
Args=--update
Args=--filter=protect .luckybackup-snaphots/
Args=/home/bkessels/bk-cloud/School
Args=/run/media/bkessels/USB Bart/
ConnectRestore=
KeepSnapshots=1
SnapshotsListItem=20171214215523
Exclude=0
ExcludeFromFile=0
ExcludeFile=
ExcludeTemp=0
ExcludeCache=0
ExcludeBackup=0
ExcludeMount=0
ExcludeLostFound=0
ExcludeSystem=0
ExcludeTrash=0
ExcludeGVFS=0
Include=0
IncludeFromFile=0
IncludeModeNormal=1
IncludeFile=
Remote=0
RemoteModule=0
RemoteDestination=1
RemoteSource=0
RemoteSSH=0
RemoteHost=
RemoteUser=
RemotePassword=
RemoteSSHPassword=
RemoteSSHPasswordStr=
RemoteSSHOptions=
RemoteSSHPort=0
OptionsUpdate=1
OptionsDelete=0
OptionsRecurse=1
OptionsOwnership=1
OptionsSymlinks=1
OptionsPermissions=1
OptionsDevices=1
OptionsCVS=0
OptionsHardLinks=0
OptionsFATntfs=0
OptionsSuper=0
OptionsNumericIDs=0
OptionsRestorent=0
OptionsVss=0
LuckyBackupDir=/home/bkessels/.luckyBackup/
VshadowDir=/usr/bin
RsyncCommand=rsync
SshCommand=ssh
DosdevCommand=/usr/bin/dosdev.exe
CygpathCommand=/usr/bin/cygpath.exe
TempPath=/tmp
ByPassWarning=0
CloneWarning=1
RepeatOnFail=0
IncludeState=1
[Task_end] - 6

[Task] - 7
Name=Software
TypeDirContents=0
TypeDirName=1
TypeSync=0
Source=/home/bkessels/bk-cloud/Software
Destination=/run/media/bkessels/USB Bart/
LastExecutionTime=20171214215525
LastExecutionErrors=0
Args=-h
Args=--progress
Args=--stats
Args=-r
Args=-tgo
Args=-p
Args=-l
Args=-D
Args=--update
Args=--filter=protect .luckybackup-snaphots/
Args=/home/bkessels/bk-cloud/Software
Args=/run/media/bkessels/USB Bart/
ConnectRestore=
KeepSnapshots=1
SnapshotsListItem=20171214215525
Exclude=0
ExcludeFromFile=0
ExcludeFile=
ExcludeTemp=0
ExcludeCache=0
ExcludeBackup=0
ExcludeMount=0
ExcludeLostFound=0
ExcludeSystem=0
ExcludeTrash=0
ExcludeGVFS=0
Include=0
IncludeFromFile=0
IncludeModeNormal=1
IncludeFile=
Remote=0
RemoteModule=0
RemoteDestination=1
RemoteSource=0
RemoteSSH=0
RemoteHost=
RemoteUser=
RemotePassword=
RemoteSSHPassword=
RemoteSSHPasswordStr=
RemoteSSHOptions=
RemoteSSHPort=0
OptionsUpdate=1
OptionsDelete=0
OptionsRecurse=1
OptionsOwnership=1
OptionsSymlinks=1
OptionsPermissions=1
OptionsDevices=1
OptionsCVS=0
OptionsHardLinks=0
OptionsFATntfs=0
OptionsSuper=0
OptionsNumericIDs=0
OptionsRestorent=0
OptionsVss=0
LuckyBackupDir=/home/bkessels/.luckyBackup/
VshadowDir=/usr/bin
RsyncCommand=rsync
SshCommand=ssh
DosdevCommand=/usr/bin/dosdev.exe
CygpathCommand=/usr/bin/cygpath.exe
TempPath=/tmp
ByPassWarning=0
CloneWarning=1
RepeatOnFail=0
IncludeState=1
[Task_end] - 7

[Task] - 8
Name=Tabs
TypeDirContents=0
TypeDirName=1
TypeSync=0
Source=/home/bkessels/bk-cloud/Tabs
Destination=/run/media/bkessels/USB Bart/
LastExecutionTime=20171214215529
LastExecutionErrors=0
Args=-h
Args=--progress
Args=--stats
Args=-r
Args=-tgo
Args=-p
Args=-l
Args=-D
Args=--update
Args=--filter=protect .luckybackup-snaphots/
Args=/home/bkessels/bk-cloud/Tabs
Args=/run/media/bkessels/USB Bart/
ConnectRestore=
KeepSnapshots=1
SnapshotsListItem=20171214215529
Exclude=0
ExcludeFromFile=0
ExcludeFile=
ExcludeTemp=0
ExcludeCache=0
ExcludeBackup=0
ExcludeMount=0
ExcludeLostFound=0
ExcludeSystem=0
ExcludeTrash=0
ExcludeGVFS=0
Include=0
IncludeFromFile=0
IncludeModeNormal=1
IncludeFile=
Remote=0
RemoteModule=0
RemoteDestination=1
RemoteSource=0
RemoteSSH=0
RemoteHost=
RemoteUser=
RemotePassword=
RemoteSSHPassword=
RemoteSSHPasswordStr=
RemoteSSHOptions=
RemoteSSHPort=0
OptionsUpdate=1
OptionsDelete=0
OptionsRecurse=1
OptionsOwnership=1
OptionsSymlinks=1
OptionsPermissions=1
OptionsDevices=1
OptionsCVS=0
OptionsHardLinks=0
OptionsFATntfs=0
OptionsSuper=0
OptionsNumericIDs=0
OptionsRestorent=0
OptionsVss=0
LuckyBackupDir=/home/bkessels/.luckyBackup/
VshadowDir=/usr/bin
RsyncCommand=rsync
SshCommand=ssh
DosdevCommand=/usr/bin/dosdev.exe
CygpathCommand=/usr/bin/cygpath.exe
TempPath=/tmp
ByPassWarning=0
CloneWarning=1
RepeatOnFail=0
IncludeState=1
[Task_end] - 8

[Task] - 9
Name=Videos (spatje)
TypeDirContents=0
TypeDirName=1
TypeSync=0
Source=/home/bkessels/bk-cloud/Videos/Dieren/Spatje
Destination=/run/media/bkessels/USB Bart/
LastExecutionTime=20171214215529
LastExecutionErrors=0
Args=-h
Args=--progress
Args=--stats
Args=-r
Args=-tgo
Args=-p
Args=-l
Args=-D
Args=--update
Args=--filter=protect .luckybackup-snaphots/
Args=/home/bkessels/bk-cloud/Videos/Dieren/Spatje
Args=/run/media/bkessels/USB Bart/
ConnectRestore=
KeepSnapshots=1
SnapshotsListItem=20171214215529
Exclude=0
ExcludeFromFile=0
ExcludeFile=
ExcludeTemp=0
ExcludeCache=0
ExcludeBackup=0
ExcludeMount=0
ExcludeLostFound=0
ExcludeSystem=0
ExcludeTrash=0
ExcludeGVFS=0
Include=0
IncludeFromFile=0
IncludeModeNormal=1
IncludeFile=
Remote=0
RemoteModule=0
RemoteDestination=1
RemoteSource=0
RemoteSSH=0
RemoteHost=
RemoteUser=
RemotePassword=
RemoteSSHPassword=
RemoteSSHPasswordStr=
RemoteSSHOptions=
RemoteSSHPort=0
OptionsUpdate=1
OptionsDelete=0
OptionsRecurse=1
OptionsOwnership=1
OptionsSymlinks=1
OptionsPermissions=1
OptionsDevices=1
OptionsCVS=0
OptionsHardLinks=0
OptionsFATntfs=0
OptionsSuper=0
OptionsNumericIDs=0
OptionsRestorent=0
OptionsVss=0
LuckyBackupDir=/home/bkessels/.luckyBackup/
VshadowDir=/usr/bin
RsyncCommand=rsync
SshCommand=ssh
DosdevCommand=/usr/bin/dosdev.exe
CygpathCommand=/usr/bin/cygpath.exe
TempPath=/tmp
ByPassWarning=0
CloneWarning=1
RepeatOnFail=0
IncludeState=1
[Task_end] - 9

[Task] - 10
Name=Werk
TypeDirContents=0
TypeDirName=1
TypeSync=0
Source=/home/bkessels/bk-cloud/Werk
Destination=/run/media/bkessels/USB Bart/
LastExecutionTime=20171214215530
LastExecutionErrors=0
Args=-h
Args=--progress
Args=--stats
Args=-r
Args=-tgo
Args=-p
Args=-l
Args=-D
Args=--update
Args=--filter=protect .luckybackup-snaphots/
Args=/home/bkessels/bk-cloud/Werk
Args=/run/media/bkessels/USB Bart/
ConnectRestore=
KeepSnapshots=1
SnapshotsListItem=20171214215530
Exclude=0
ExcludeFromFile=0
ExcludeFile=
ExcludeTemp=0
ExcludeCache=0
ExcludeBackup=0
ExcludeMount=0
ExcludeLostFound=0
ExcludeSystem=0
ExcludeTrash=0
ExcludeGVFS=0
Include=0
IncludeFromFile=0
IncludeModeNormal=1
IncludeFile=
Remote=0
RemoteModule=0
RemoteDestination=1
RemoteSource=0
RemoteSSH=0
RemoteHost=
RemoteUser=
RemotePassword=
RemoteSSHPassword=
RemoteSSHPasswordStr=
RemoteSSHOptions=
RemoteSSHPort=0
OptionsUpdate=1
OptionsDelete=0
OptionsRecurse=1
OptionsOwnership=1
OptionsSymlinks=1
OptionsPermissions=1
OptionsDevices=1
OptionsCVS=0
OptionsHardLinks=0
OptionsFATntfs=0
OptionsSuper=0
OptionsNumericIDs=0
OptionsRestorent=0
OptionsVss=0
LuckyBackupDir=/home/bkessels/.luckyBackup/
VshadowDir=/usr/bin
RsyncCommand=rsync
SshCommand=ssh
DosdevCommand=/usr/bin/dosdev.exe
CygpathCommand=/usr/bin/cygpath.exe
TempPath=/tmp
ByPassWarning=0
CloneWarning=1
RepeatOnFail=0
IncludeState=1
[Task_end] - 10


[profile end]
