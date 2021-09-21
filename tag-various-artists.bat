REM -- Set 'Various Artists' field from a valid 'beets ls' query string
REM
REM -- Needs paths set to kid3-cli.exe windows 64 build from https://kid3.kde.org/
REM -- and metaflac.exe from https://ftp.osuosl.org/pub/xiph/releases/flac/
REM
REM -- Remember to run 'beet update' after you are happy with the modifications
REm -- and then 'beet move'

set PATH=%PATH%;C:\Users\conta\Downloads\kid3-3.8.7-win32-x64\kid3-3.8.7-win32-x64
set PATH=%PATH%;C:\Users\conta\Downloads\flac-1.3.2-win\flac-1.3.2-win\win64

setlocal
FOR /F "tokens=*" %%G IN ('beet ls -p %*') DO (
  kid3-cli.exe -c "set albumartist ''" -c "set albumartist 'Various Artists'" "%%G"
  metaflac.exe --remove-tag="album artist" "%%G"
  metaflac.exe --set-tag="album artist=Various Artists" "%%G"
)
endlocal