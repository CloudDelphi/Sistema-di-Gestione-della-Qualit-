set PGUSER=postgres
set PGPASSWORD=12345

for /f "tokens=1,2,3,4 delims=/ " %%a in ('date /T') do set Date=%%c-%%b-%%a
for /F "tokens=1-3 delims=: " %%a in ('time /T') do set time=%%c%%a%%b 
   
C:\"Program Files"\PostgreSQL\9.4\bin\pg_dump.exe -i -h localhost -p 5432 -Fc -b -o -v -f "E:\TesteBackup %date%-%time%.backup" destra
pause