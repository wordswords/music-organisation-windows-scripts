REM 1. Needs JDK > 17 path set, latest JDK is recommended
REM 2. Needs https://github.com/Ezwen/bandcamp-collection-downloader jar in same directory
REM 3. Remember to change 'socialistsynthesis' to your own bandcamp ID!

setx JAVA_HOME "C:\Program Files\Java\jdk-17"
set JAVA_HOME "C:\Program Files\Java\jdk-17"
"C:\Program Files\Java\jdk-17\bin\java.exe" -jar bandcamp-collection-downloader.jar -f=flac -j=1 -r=3 socialistsynthesis


