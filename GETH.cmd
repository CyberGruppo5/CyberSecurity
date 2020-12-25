@echo off
echo WELCOME, NOW WE ARE STARTING THE BLOCKCHAIN!
ECHO.
cd ..
docker-compose up -d

:MENU
ECHO.
ECHO ...............................................
ECHO WHICH BLOCKCHAIN NODE DO YOU WANT TO ENTER THE GETH JAVASCRIPT CONSOLE WITH?
ECHO ...............................................
ECHO.
ECHO PRESS 1 FOR NODE 1
ECHO PRESS 2 FOR NODE 2
ECHO PRESS 3 FOR NODE 3
ECHO PRESS 4 FOR EXIT
ECHO.
SET /P M=Type 1, 2, 3, or 4 then press ENTER: 
IF %M%==1 GOTO nodo1
IF %M%==2 GOTO nodo2
IF %M%==3 GOTO nodo3
IF %M%==4 GOTO EOF
:nodo1
ECHO.
docker-compose exec node1 /bin/sh -c "geth attach qdata/dd/geth.ipc"
pause
CLS
GOTO MENU

:nodo2
ECHO.
docker-compose exec node2 /bin/sh -c "geth attach qdata/dd/geth.ipc"
pause
CLS
GOTO MENU

:nodo3
ECHO.
docker-compose exec node3 /bin/sh -c "geth attach qdata/dd/geth.ipc"
pause
CLS
GOTO MENU