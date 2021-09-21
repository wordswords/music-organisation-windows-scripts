REM -- Set albumartist tag field to 'Various Artists' field from a valid 'beet ls' query string
REM -- This is to ensure that Plex Media Server properly indexes and displays DJ mix compliations 
REM -- Works with FLAC and MP3 files. Beets.io is essential and can be downloaded from https://beets.io
REM
REM -- Needs paths set to kid3-cli.exe windows 64 build from https://kid3.kde.org/
REM -- and metaflac.exe from https://ftp.osuosl.org/pub/xiph/releases/flac/
REM
REM -- Remember to run 'beet update' after you are happy with the modifications
REM -- and then 'beet move'
REM -- 
REM -- For more info see: https://davidcraddock.net/2021/09/21/how-to-fix-plex-media-servers-various-artists-problem-using-beets-io-and-other-tools/
REM -- 

setlocal
set PATH=%PATH%;C:\Users\conta\Downloads\kid3-3.8.7-win32-x64\kid3-3.8.7-win32-x64
set PATH=%PATH%;C:\Users\conta\Downloads\flac-1.3.2-win\flac-1.3.2-win\win64

FOR /F "tokens=*" %%G IN ('beet ls -p %*') DO (
  kid3-cli.exe -c "set albumartist ''" -c "set albumartist 'Various Artists'" "%%G"
  metaflac.exe --remove-tag="album artist" "%%G"
  metaflac.exe --set-tag="album artist=Various Artists" "%%G"
)
endlocal
