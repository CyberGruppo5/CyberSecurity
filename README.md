# CyberSecurity
Il progetto realizzato consiste nell’implementazione di un sistema che permetta di digitalizzare in maniera sicura i dati relativi ad un cantiere edilizio. Per far questo ci siamo serviti di tecnologie e metodi che ci hanno consentito di informatizzare il sistema di registrazione delle informazioni sul giornale dei lavori al fine di assicurare che il lavoro venga fatto e registrato regolarmente. In particolare, ciò che si dovrà registrare sul giornale dei lavori saranno misure ed immagini (e altre meta-informazioni). 

Per lo sviluppo di questo progetto ci siamo serviti di: 
-	un drone per l’acquisizione delle immagini; 
-	un servizio di fotogrammetria per il calcolo delle misure a partire dalle immagini scattate dal drone; 
-	opportune tecnologie che ci consentiranno di registrare e memorizzare tutto ciò che sarà di nostro interesse. 

Descriviamo l’iter delle operazioni che sono di interesse del nostro sistema: 
1.	Il drone acquisirà immagini dall’alto; 
2.	Invio delle immagini al servizio di fotogrammetria che ne calcolerà le relative misure; 
3.	Registrazione sul giornale dei lavori delle misure e delle relative immagini. 
 
La forza del nostro progetto è, quindi, quella di digitalizzare queste operazioni di registrazione delle informazioni al fine di creare un sistema che migliori quello odierno sotto il punto di vista della sicurezza, degli illeciti, della portabilità, della disponibilità, dell’integrità e dell’affidabilità. Per realizzare questo ci si è affidati alla tecnologia Blockchain, che garantisce sicurezza e affidabilità dell’informazione memorizzata.  

Con questa guida andremo a mostrare, in prima battuta, come predisporre l’ambiente di sviluppo e di esecuzione del nostro sistema. Fatto questo, poi, vi accompagneremo passo dopo passo attraverso tutte le funzionalità del nostro sistema.


## Predisporre l’ambiente di sviluppo e di esecuzione
Ora procederemo all’installazione e alla configurazione di Docker, Node.js (con tutti i pacchetti necessari), e Quorum.

### Installazione Docker
Per scaricare l’applicativo di Docker ci siamo recati sul sito ufficiale e abbiamo scaricato la versione per Windows reperibile al seguente link: https://www.docker.com/products/docker-desktop. Una volta effettuato il download, seguire i classici passi di installazione di un qualunque software.



### Installazione Node.js
Per scaricare l’applicativo di Node.js ci siamo recati sul sito ufficiale e abbiamo scaricato la versione per Windows reperibile al seguente link: https://nodejs.org/it/. Una volta effettuato il download, seguire i classici passi di installazione di un qualunque software.

Consiglio: nel momento in cui apparirà la seguente schermata, consigliamo di spuntare la checkbox che acconsentirà ad installare automaticamente tutti i tool necessari:

![](github%20pictures%20for%20README/0.png)

Una volta completata l'installazione, possiamo verificare se Node.js è stato correttamente installato aprendo una nuova finestra del terminale e lanciando il comando “node -v”. Il risultato che si otterrà, se tutto è andato a buon fine, sarà il seguente:
![](github%20pictures%20for%20README/0b.png)


Per installare i pacchetti che saranno necessari per la configurazione del nostro sistema, apriamo il terminale e lanciamo i seguenti comandi:
-	npm install -g web3
-	npm install -g readline
-	npm install -g readline-sync
-	npm install -g crypto
-	npm install -g image-hash
-	npm install -g solc@0.5.0 


Nota: inserendo “-g” in ogni istruzione abbiamo acconsentito l’installazione dei pacchetti a livello globale. Nel momento in cui vogliamo installarli localmente (quindi all’interno della nostra cartella che ospiterà l’installazione di Quorum) dobbiamo spostarci dentro la cartella e, prima di lanciare l’installazione di tutti i pacchetti senza “-g”, dobbiamo eseguire il comando “npm init”.


Nota 2: con il comando “npm install -g solc@0.5.0” andiamo ad installare il compilatore Solidity. Anche se la documentazione di Node.js consiglia di installare l’ultima release, noi abbiamo scelto di installare la versione 0.5.0 che è la più richiesta dalla community online.
Il compilatore ci è servito, appunto, per compilare lo smart contract e generare l’abi e il bytecode. Per farlo abbiamo aperto il terminale, ci siamo spostati nella cartella dov’è presente il nostro smart contract (denominato “MySmartContract.sol”) ed eseguito il comando “solcjs --bin --abi MySmartContract.sol”.


### Installazione Qurum
In questa fase mostreremo quali sono gli step necessari per configurare Quorum sulla nostra macchina.
In questa guida presenteremo 2 metodi per configurare Quorum sulla nostra macchina:
1)	Il primo metodo, che è quello che consigliamo se si dispone di un PC abbastanza potente, è quello di configurare la release ufficiale di Quorum direttamente dal github di ConsenSys (cioè quello che originariamente apparteneva a JPMorgan Chase). Per far questo, ci si dovrà recare nella sezione github relativa alla blockchain Quorum sviluppata da JPMorgan Chase (https://github.com/ConsenSys/quorum-examples) e si dovranno le istruzioni per la configurazione di Qurum con Docker (che sul README.md della pagina vengono riportate sotto la voce di “Running with Docker”).
Il vantaggio di questa versione è che comprende tantissime funzionalità!
Lo svantaggio, ovviamente, lo riscontriamo computazionalmente. Infatti, per mandare in esecuzione i 7 nodi (previsti da questa versione di Quorum) con Docker in maniera fluida ed utilizzabile, serve una potenza di calcolo che non tutti i PC privati hanno.

    Requisiti minimi consigliati: 
    - almeno un processore Intel® i7;
    - almeno 8 GB di RAM;
    - SSD.

Per verificare che tutto è andato a buon fine eseguire i seguenti passaggi: aprire il terminale, spostarsi nella cartella che ospita i 7 nodi appena installati, eseguire l’istruzione “docker ps -a” per vedere tutti i container che ci sono (sia quelli attivi e sia quelli stoppati). Se tutto è andato nel verso giusto dovrebbero apparire 7 container per i nodi, 7 transaction manager ed 1 container chiamato “cakeshop” (che è un’interfaccia alla blockchain che ci dà la possibilità di visualizzare lo stato della blockchain e di vedere lo stato del proprio nodo, di vedere le transazioni, ecc…).

2)	Il secondo metodo, che è quello che consigliamo se non si dispone di un PC abbastanza potente, è quello di configurare quorum tramite la versione presente nel seguente link: https://docs.goquorum.consensys.net/en/stable/HowTo/GetStarted/Wizard/GettingStarted/.
Seguire le istruzioni che si trovano nella pagina oppure procedere con i seguenti passi:

     a)	Aprire il terminale e lanciare il comando “npm install -g quorum-wizard”.

     b)	Lanciare il comando “quorum-wizard”.

     c)	Scegliere la configurazione che si preferisce. Nel nostro sistema le scelte che sono state effettuate sono state le seguenti:
     ![](github%20pictures%20for%20README/1.PNG)
     ![](github%20pictures%20for%20README/2.PNG)
     
     Qui dobbiamo scegliere quale algoritmo del consenso adottare (noi abbiamo scelto “istanbul”):
     ![](github%20pictures%20for%20README/3.PNG)
     
     A questo punto il sistema ci chiederà quanti nodi vogliamo installare. Chiaramente, maggiore è il numero di nodi che contemporaneamente dovranno essere mandati in esecuzione e maggiori saranno le risorse computazionali che verranno richieste alla macchina. 
     Nota: noi abbiamo scelto 3 nodi.
     ![](github%20pictures%20for%20README/4.PNG)
     
     
     
     Qui viene scelta la versione di Quorum:
     
     ![](github%20pictures%20for%20README/5.PNG)
     
     
     
     Qui viene scelta la versione di Tessera (piattaforma per la gestione della privacy):
     ![](github%20pictures%20for%20README/6.PNG)
     ![](github%20pictures%20for%20README/7.PNG)
     ![](github%20pictures%20for%20README/8.PNG)
     
     Se tutto è andato a buon fine, dovremmo avere questa situazione:
     ![](github%20pictures%20for%20README/9.PNG)
     
     Quindi è stata creata la cartella “network” e all’interno è stata creata la cartella chiamata “3-nodes-istanbul-tessera-bash” (nome che abbiamo dato noi in uno degli step di configurazione) che contiene tutti i file (tra cui “docker-compose.yml”).
     
     
     Fatto questo ci spostiamo nella cartella “3-nodes-istanbul-tessera-bash”:
     
     ![](github%20pictures%20for%20README/10.PNG)
     
     
     Poi lanciamo il comando “start.cmd”:
     
     ![](github%20pictures%20for%20README/11.PNG)
     
     
     Fatto questo, la situazione che avremo nell’applicazione Docker sarà la seguente:
     ![](github%20pictures%20for%20README/12.PNG)
     Se i container sono verdi vuol dire che i nodi sono accesi; se sono grigi, invece, vuol dire che sono stoppati.



## Esecuzione del sistema
Come operazione preliminare, recarsi nella cartella di riferimento che ospita tutto il sistema appena installato e mandare in esecuzione il seguente comando:
git clone https://github.com/CyberGruppo5/CyberSecurity.git

Fatto questo, seguiamo passo passo i prossimi step:
1)	Per prima cosa mandare in esecuzione Docker e accendere tutti i nodi. 
2)	Fatto questo, entrare nella cartella di riferimento (che in quest’esempio si trova nel percorso “C:\Users\Luca\network\3-nodes-istanbul-tessera-bash”) accedere alla cartella creata dopo aver lanciato il comando “git clone” (che si chiamerà CyberSecurity) ed eseguire il file .cmd denominato “GETH.cmd”.
La schermata che ci si presenterà davanti sarà la seguente:
![](github%20pictures%20for%20README/13.png)

    A questo punto dobbiamo scegliere con quale nodo andare a fare il deploy dello smart contract sulla blockchain. 
    Attenzione: solo il nodo con il quale andremo a caricare lo smart contract potrà andare a scrivere sulla blockchain. Questa funzionalità che ci permette di fare questo è stata implementata proprio all’interno dello smart contract.

    Una volta scelto il nodo (ad esempio scegliamo il nodo 1) la schermata che ci si presenterà davanti sarà la seguente:
    ![](github%20pictures%20for%20README/14.png)

    A questo punto andremo ad eseguire il comando “loadScript(“SmartContract.js”)” che ci permette di mandare in esecuzione lo script “SmartContract.js”, all’interno della Geth JavaScript console, necessario per caricare lo smart contract sulla blockchain. La schermata che ci si presenterà davanti sarà la seguente:
    
    ![](github%20pictures%20for%20README/15.png)

    Come vediamo, il contratto è stato caricato e ci è stato restituito il TransactionHash e l’address del contratto. Per concludere quest’operazione, ci copiamo l’indirizzo del contratto che ci servirà per andare ad effettuare le operazioni di scrittura e/o lettura sulla blockchain.

    ATTENZIONE: se il comando “loadScript” ritorna “false” vuol dire che qualcosa non è andato a buon fine. Questo problema può essere aggirato eseguendo il deploy del contratto con le seguenti operazioni:              
        a)	Aprire il terminale, recarsi nella cartella di riferimento (che in quest’esempio si trova nel percorso “C:\Users\Luca\network\3-nodes-istanbul-tessera-bash”) e lanciare il seguente comando:
        docker cp .\CyberSecurity\SmartContract.js node1:/SmartContract.js                      
        b)	Fatto ciò, lanciare il seguente comando: docker-compose exec node1 /bin/sh -c "geth --exec 'loadScript(\"SmartContract.js\")' attach qdata/dd/geth.ipc"          
        A questo punto il contratto è stato caricato e in output ci ritorna il TransactionHash (che sarebbe una stringa esadecimale che rappresenta l’hash della transazione) che ci copieremo perché ci servirà a breve.                
        c)	Ora, dato che abbiamo il TransactionHash ma abbiamo bisogno dell’indirizzo del contratto, dobbiamo entrare nel nodo 1 e lanciare il comando “eth.getTransactionReceipt”. Per far questo digitiamo il seguente comando:                
        docker-compose exec node1 /bin/sh -c "geth attach qdata/dd/geth.ipc"            
        Una volta entrati nel nodo 1, lanciamo il comando “eth.getTransactionReceipt” dandogli in input il TransactionHash nel seguente modo:             
        eth.getTransactionReceipt("<TransactionHash>")          
        Nell’output che ci ritorna quest’ultimo comando troveremo l’indirizzo del contratto che ci andremo a copiare per poi passare allo step 3 della guida.

    Nota: com’è possibile vedere, per la risoluzione del problema di caricamento del contratto abbiamo preso come esempio il nodo 1. Possiamo facilmente farlo con gli altri nodi lanciando i comandi in maniera speculare andando a sostituire il numero di un altro nodo dove vediamo “1”.

3)	Tornare nella cartella “CyberSecurity” e mandare in esecuzione il file .cmd denominato “MENU.cmd”.
La schermata che ci si presenterà davanti sarà la seguente:

    ![](github%20pictures%20for%20README/16.png)


    Descriviamo queste 6 funzionalità:
    a)	l’opzione numero 1 ci consente di calcolare l’hash dell’immagine e delle misure che andremo poi a scrivere sulla blockchain;
    b)	l’opzione numero 2 ci consente di andare a scrivere l’hash dell’immagine e l’hash delle misure che ci siamo calcolati con l’opzione numero 1;
    c)	 l’opzione numero 3 ci consente di andare ad effettuare un’operazione di lettura sulla blockchain;
    d)	l’opzione numero 4 ci consente di andare a controllare se un’immagine (tramite il suo hash) è già stata registrata sulla blockchain;
    e)	l’opzione numero 5 ci consente di andare a controllare se una misura (tramite il suo hash) è già stata registrata sulla blockchain;
    f)	l’opzione numero 6 ci consente di visualizzare tutti i container che ci sono su Docker (sia quelli attivi e sia quelli stoppati).
