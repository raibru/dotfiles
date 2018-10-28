@echo off
@echo --------------------------------------------------
@echo Sync to OneDrive the user vim configuration (WS16)
@echo --------------------------------------------------

SETLOCAL

set SRCPATH="C:\Users\rbr"
set DESTPATH="C:\Users\rbr\OneDrive\Anwendungen\vim"
set LOGFILE="C:\Users\rbr\OneDrive\Anwendungen\vim\syncToUSB.log"
set ACCESSFILE="C:\Users\rbr\.vim\_SyncToOneDrive.info"
set SYNCTOOL=robocopy.exe
set EXCLDIRS="D:\LOST.DIR" "E:\System Volume Information"
set EXCLFILES=

@echo Start sync process...

IF NOT EXIST %ACCESSFILE% goto failed
@echo ...sync process needs Destination %DESTPATH%

date /t > %LOGFILE%

:sync

@echo ...run robocopy

cd \
%SYNCTOOL% %SRCPATH% %DESTPATH% _vimrc /W:5 /R:30 /DST /COPY:DT /TEE /LOG+:%LOGFILE%
%SYNCTOOL% %SRCPATH%\.vim %DESTPATH%\.vim /XF %EXCLFILES% /XD %EXCLDIRS% /W:5 /R:30 /MIR /DST /COPY:DT /TEE /LOG+:%LOGFILE%
@echo ...robocopy...ok
@echo ...Sync...ok

goto end

:failed
@echo Sync directory not found...
@echo ...Sync...stops

:end
date /t > %ACCESSFILE%
ENDLOCAL
pause
