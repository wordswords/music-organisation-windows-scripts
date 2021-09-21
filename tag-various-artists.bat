setlocal
FOR /F "tokens=*" %%G IN ('beet ls -p %*') DO (
  kid3-cli.exe -c "remove albumartist" -c "set albumartist 'Various Artists'" "%%G"
)
endlocal