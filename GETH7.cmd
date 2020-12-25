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
ECHO PRESS 4 FOR NODE 4
ECHO PRESS 5 FOR NODE 5
ECHO PRESS 6 FOR NODE 6
ECHO PRESS 7 FOR NODE 7
ECHO PRESS 8 FOR EXIT
ECHO.
SET /P M=Type 1, 2, 3, 4, 5, 6, 7 or 8, then press ENTER: 
IF %M%==1 GOTO nodo1
IF %M%==2 GOTO nodo2
IF %M%==3 GOTO nodo3
IF %M%==4 GOTO nodo4
IF %M%==5 GOTO nodo5
IF %M%==6 GOTO nodo6
IF %M%==7 GOTO nodo7
IF %M%==8 GOTO EOF
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

:nodo4
ECHO.
docker-compose exec node4 /bin/sh -c "geth attach qdata/dd/geth.ipc"
pause
CLS
GOTO MENU

:nodo5
ECHO.
docker-compose exec node5 /bin/sh -c "geth attach qdata/dd/geth.ipc"
pause
CLS
GOTO MENU

:nodo6
ECHO.
docker-compose exec node6 /bin/sh -c "geth attach qdata/dd/geth.ipc"
pause
CLS
GOTO MENU

:nodo7
ECHO.
docker-compose exec node7 /bin/sh -c "geth attach qdata/dd/geth.ipc"
pause
CLS
GOTO MENU