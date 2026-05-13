Il **File Sharing** (condivisione di file) è il servizio di rete che permette la distribuzione e l'accesso a risorse digitali (documenti, file multimediali, software) tra più utenti o dispositivi attraverso una rete (Internet o LAN). Come l'e-mail, si basa su protocolli di rete, ma è ottimizzato per il trasferimento di grandi quantità di dati e per la gestione della persistenza delle informazioni.

---
### PROTOCOLLO FTP

Il protocollo FTP (File Transfer Protocol) è un protocollo a livello di applicazione utilizzato per il trasferimento di file, basato sul paradigma [[Application Layer#Architettura Client-Server|client-server]].

---
#### Connessioni TCP

FTP opera secondo il classico modello client-server: il client è il dispositivo che avvia il trasferimento, mentre il server è il dispositivo remoto. A differenza di molti altri protocolli applicativi, FTP utilizza due connessioni TCP distinte e separate:

- **Connessione di controllo (porta 21):** usata per trasmettere informazioni di gestione (nome utente, password, comandi per navigare le directory, ecc.). Rimane aperta per tutta la durata della sessione.
- **Connessione dati (porta 20):** aperta ogni volta che si deve effettivamente trasferire un file, e chiusa subito dopo. Una nuova connessione dati viene stabilita ad ogni trasferimento.  

> N.B. Questa separazione tra canale di controllo e canale dati è una caratteristica distintiva di FTP rispetto ad HTTP, che invece usa una sola connessione.

---
#### Funzionamento della sessione

Quando l'utente avvia il client con il comando ftp **\<nome host\>**, viene stabilita la connessione di controllo sulla porta 21. Il client invia quindi credenziali (USER e PASS) per autenticarsi. Una volta autorizzato, il client può trasferire file dal file system locale a quello remoto (STOR) o viceversa (RETR), aprendo e chiudendo la connessione dati sulla porta 20 per ciascun trasferimento.

![[ftp.png]]
  

> N.B. FTP è un protocollo **stateful**: mantiene lo stato della sessione corrente, inclusa la directory attiva e l'autenticazione, per tutta la durata della connessione.

---

**Principali comandi FTP:**

- **ABOR**: Interrompe il comando precedente
- **CDUP**: Torna alla directory del livello superiore   
- **CWD** \<nome directory\>: Cambia la directory corrente 
- **DELE** \<nome file\>: Elimina il file specificato
- **LIST** \<nome directory\>: Elenca i file nella directory
- **MKD** \<nome directory\>: Crea una nuova directory
- **PASS** \<password\>: Invia la password dell'utente
- **PASV**: Il server sceglie la porta per la connessione dati
- **PORT** \<porta\>: Il client sceglie la porta per la connessione dati
- **PWD**: Mostra il nome della directory corrente
- **QUIT**: Termina la comunicazione
- **RETR** \<nome dei file\>: Trasferisce uno o più file dal server al client
- **RMD** \<nome directory\>: Elimina la directory specificata
- **RNTO** \<vecchio nome\> \<nuovo nome\>: Rinomina il file
- **STOR** \<nome dei file\>: Trasferisce uno o più file dal client al server
- **USER** \<nome utente\>: Invia il nome utente

---
### PROTOCOLLO BITTORRENT

BitTorrent è un protocollo a livello di applicazione per la distribuzione di file basato sul paradigma [[Application Layer#Architettura Peer-to-Peer (P2P)|peer-to-peer]] (P2P). Non ha una porta standard, ma utilizza tipicamente le porte nel range 6881–6889 con il protocollo TCP.

> [!help]
> **Torrent:** l'insieme di tutti i peer che partecipano alla distribuzione di un determinato file.
> **Chunk:** porzioni del file di dimensione uniforme (es. 256 kByte) che i peer si scambiano.
> **Tracker:** nodo infrastrutturale che traccia tutti i peer attivi nel torrent e ne coordina l'ingresso.
> **Seeder:** peer che, durante o dopo il download, carica blocchi verso altri peer.
> **Leecher:** peer che abbandona il torrent non appena completa il proprio download, senza contribuire agli altri.

--- 

**Ingresso nel torrent e connessione ai peer:**

Quando un nuovo peer (es. Giulio) entra in un torrent, si registra presso il tracker, che gli restituisce un sottoinsieme casuale di peer partecipanti (tipicamente 50). Giulio tenta di stabilire connessioni TCP con ciascuno di essi: quelli con cui riesce a connettersi diventano i suoi peer vicini (**neighboring peers**). Nel tempo, alcuni vicini possono lasciare il torrent e nuovi peer possono aggiungersi, rendendo il vicinato dinamico.

![[bittorrent.png]]

---

**Strategia di richiesta Rarest First:**

In ogni momento, peer diversi possiedono sottoinsiemi diversi dei chunk del file. Periodicamente, ogni peer interroga i propri vicini per conoscere quali chunk possiedono. Quando deve richiedere dei chunk mancanti, adotta la strategia **rarest first** (il più raro prima): vengono richiesti prioritariamente **i chunk con il minor numero di copie disponibili tra i vicini**. Questo meccanismo accelera la redistribuzione dei chunk più rari, tendendo ad uniformare il numero di copie di ciascun chunk nel torrent.

---

**Meccanismo di incentivo: Tit-for-Tat:**

Per scoraggiare i leecher e incentivare la collaborazione, BitTorrent adotta un meccanismo di reciprocità detto tit-for-tat (pan per focaccia):

- **Top 4 unchoked:** ogni peer invia chunk ai quattro vicini che gli stanno inviando dati alla velocità maggiore. Questi peer sono detti "non soffocati" (unchoked).
- **Choked:** tutti gli altri peer vengono "soffocati" (choked): non ricevono chunk dal peer corrente.
- **Rivalutazione ogni 10 secondi:** la classifica dei 4 unchoked viene ricalcolata sulla base delle velocità di upload correnti.
- **Optimistic unchoke (ogni 30 secondi):** un peer soffocato viene sbloccato casualmente. Questo permette ai nuovi arrivati di ottenere i primi chunk e di entrare eventualmente nella top 4 di qualche vicino, avviando così scambi reciproci.

Grazie al tit-for-tat, i peer che trasmettono a velocità simili tendono a trovare partner di scambio compatibili. Senza questo meccanismo, la maggior parte degli utenti si comporterebbe da freeloader, scaricando senza contribuire.

---
