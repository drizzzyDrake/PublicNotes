La **posta elettronica**, meglio conosciuta come **e-mail** (electronic mail), è un servizio internet che ti permette di inviare e ricevere messaggi digitali in modo quasi istantaneo e asincrono. Come il web è un'**applicazione di rete di tipo [[Application Layer#Architettura Client-Server|client-server]]**, ma presenta più componenti funzionali. 

---
### COMPONENTI FUNZIONALI

Il sistema di posta elettronica si articola in tre componenti funzionali: 

---

**User Agent (UA):** 

Processo attivo sul client utente, avviato dall'utente stesso o da un timer. Si occupa di informare l'utente della disponibilità di nuovi messaggi, e consente di comporre, modificare, inviare e leggere la posta. Ogni messaggio composto viene passato a un MTA per il trasporto. Esempi tipici sono Microsoft Outlook, Apple Mail e Thunderbird, ma rientra in questa categoria anche un'interfaccia webmail come Gmail.

---

**Mail Transfer Agent (MTA):** 

Processo attivo su un **mail server**, responsabile del trasferimento dei messaggi attraverso Internet, sia quando li riceve da uno UA sia quando li riceve da un altro MTA. Costituisce il nucleo dell'infrastruttura di trasporto. Esempi diffusi di MTA sono Sendmail, Postfix ed Exim. Se la consegna non è possibile, l'MTA mittente trattiene il messaggio in una coda e ritenta ogni 30 minuti. Dopo alcuni giorni senza successo, rimuove il messaggio e notifica il mittente con un'e-mail di errore.

---

**Mail Access Agent (MAA):** 

Processo attivo sul mail server del destinatario, utilizzato per rendere accessibili i messaggi in arrivo allo UA del destinatario tramite **POP3** o **IMAP**. È necessario perché **SMTP**, essendo un protocollo **push**, non può essere usato in direzione inversa per il recupero dei messaggi. Esempi comuni sono Dovecot e Cyrus IMAP.

---

Ogni mail server è dotato di una **mailbox** (casella di posta), contenente i messaggi in arrivo per l'utente, e di una **coda di messaggi**, contenente i messaggi ancora da inviare. Nella pratica, un singolo server ospita contemporaneamente MTA e MAA: la distinzione tra questi ruoli è concettuale e architetturale, non necessariamente fisica. Nelle infrastrutture di grandi provider, tuttavia, i tre componenti possono essere distribuiti su cluster separati per ragioni di scalabilità e affidabilità.

---
### FLUSSO DI UN MESSAGGIO

Il percorso tipico di un messaggio dal mittente al destinatario è il seguente:

![[e-mail.png]]

- Il mittente usa il suo UA per comporre il messaggio e inserisce l'indirizzo del destinatario.
- Lo UA del mittente consegna il messaggio all'MTA del suo mail server, che lo inserisce nella coda dei messaggi in uscita.
- L'MTA del mittente apre una connessione TCP con l'MTA del mail server del destinatario e trasmette il messaggio.
- L'MTA del destinatario riceve il messaggio e lo deposita nella mailbox.
- Il destinatario invoca il suo UA, che preleva il messaggio dalla mailbox tramite il MAA, usando POP3 o IMAP.

---
### FORMATO DEI MESSAGGI

Il formato dei messaggi e-mail (plain text) è definito dall'RFC 822 e prevede:

![[e-mail format.png]]

---

**Principali campi di intestazione:**

- **To:** indirizzo del destinatario
- **From:** indirizzo del mittente
- **Subject:** argomento del messaggio
- **Sender:** nome del mittente
- **CC:** indirizzi in copia conoscenza (Carbon Copy)
- **BCC:** indirizzi in copia nascosta (Blind Carbon Copy), non visibili al destinatario

> N.B. Il body contiene il testo del messaggio, composto esclusivamente da caratteri ASCII salvo l'uso di **MIME**. È importante inoltre distinguere i campi dell'header dai comandi SMTP.

---

**Esempio di e-mail:**

> [!example]
> From: giuliodio@hotmail.com <b style="color: gray;">header line</b>
> To: andreacata@coldmail.edu <b style="color: gray;">header line</b>
> Subject: Esame di Python. <b style="color: gray;">header line</b>
> <b style="color: gray;">empty line</b>
> Ma che per caso hai passato l'esame di Python? <b style="color: gray;">body line</b>
> Ah giusto! hai copiato da me, non mi ricordavo. <b style="color: gray;">body line</b>
> A presto, <b style="color: gray;">body line</b>
> Giulio. <b style="color: gray;">body line</b>

---
### PROTOCOLLO SMTP

**SMTP (Simple Mail Transfer Protocol)**, definito nell'RFC 5321, è il protocollo applicativo principale per il trasferimento della posta tra MTA. Opera sulla porta 25, si appoggia a TCP per garantire l'affidabilità della trasmissione ed è un protocollo di tipo **push**: è l'MTA mittente ad aprire la connessione TCP verso l'MTA destinatario, senza ricorrere a server intermedi. Il trasferimento avviene in tre fasi:

- Il client SMTP tenta di stabilire una connessione TCP sulla porta 25 con il server STMP (TCP handshaking). Se il server è attivo, la connessione TCP viene stabilita. Altrimenti, il client riproverà dopo un determinato lasso di tempo.
- Una volta stabilita la connessione, il client e il server effettuano una forma aggiuntiva di handshaking, dove il client indica al server l’indirizzo email del mittente e del destinatario
- Il client invia il messaggio sulla connessione TCP. Una volta ricevuto il messaggio, se ci sono altri messaggi da inviare viene utilizzata la stessa connessione TCP (connessione persistente). Altrimenti, il client invia al server una richiesta di chiusura della connessione.

---
#### Comandi principali

I comandi principali del dialogo SMTP sono:

- **HELO** : presentazione del client
- **MAIL FROM** : indirizzo del mittente
- **RCPT TO** : indirizzo del destinatario
- **DATA** : inizio del corpo del messaggio 
- **QUIT** : chiusura della connessione

Di seguito, vediamo un esempio di interazione tra un server SMTP (coldmail.edu), indicato con S, e un client SMTP (hotmail.com), indicato con C:

> [!example]
> S: 220 coldmail.edu
> C: HELO hotmail.com
> S: 250 Hello hotmail.com, pleased to meet you
> C: MAIL FROM: \<giuliodio@hotmail.com\>
> S: 250 giuliodio@hotmail.com ... Sender ok
> C: RCPT TO: \<andreacata@coldmail.edu\>
> S: 250 andreacata@coldmail.edu ... Recipient ok
> C: DATA
> S: 354 Enter mail, end with "." on a line by itself
> C: Ma che per caso hai passato l'esame di Python?
> C: Ah giusto! hai copiato da me, non mi ricordavo.
> C: .
> S: 250 Message accepted for delivery
> C: QUIT
> S: 221 coldmail.edu closing connection

> Codice **220** : **Service Ready**, il server è acceso, attivo e pronto a ricevere comandi.
> Codice **221** : **Closing Connection**, il server saluta e chiude il canale (risposta al comando `QUIT`).
> Codice **250** : **OK / Success**, L'azione richiesta è stata completata con successo.
> Codice **354** : **Start Mail Input**, l server dice: "Ho capito, ora scrivi pure il testo dell'email".

SMTP supporta [[Web#Connessioni persistenti|connessioni persistenti]]: se l'MTA mittente deve inviare più messaggi allo stesso MTA destinatario, li trasmette tutti sulla stessa connessione TCP, inviando `QUIT` solo al termine. Una limitazione significativa di SMTP è che tratta l'intero messaggio, compreso il corpo, come testo **ASCII a 7 bit**. Qualsiasi contenuto binario deve essere codificato prima dell'invio e decodificato alla ricezione. Per superare questo limite è stato introdotto il protocollo **MIME**.

---
### PROTOCOLLO MIME

MIME (Multipurpose Internet Mail Extension), definito negli RFC 2045 e 2046, estende il formato dei messaggi di posta elettronica per supportare contenuti multimediali. Aggiunge all'header del messaggio alcuni campi aggiuntivi:

- **MIME-Version**: indica la versione del protocollo MIME utilizzata.
- **Content-Type**: indica il tipo di dato multimediale contenuto nel messaggio.
- **Content-Transfer-Encoding**: specifica la codifica utilizzata per convertire il contenuto binario in testo ASCII (tipicamente Base64) prima della trasmissione. Il destinatario decodifica il contenuto una volta ricevuto il messaggio.

> [!example]
> From: giuliodio@hotmail.com <b style="color: gray;">header line</b>
> To: andreacata@coldmail.edu <b style="color: gray;">header line</b>
> Subject: Esame di Python. <b style="color: gray;">header line</b>
> MIME-Version: 1.0 <b style="color: gray;">header line</b>
> Content-Transfer-Encoding: Base64 <b style="color: gray;">header line</b>
> Content-Type: image/jpeg <b style="color: gray;">header line</b>
> <b style="color: gray;">empty line</b>
> Ma che per caso hai passato l'esame di Python? <b style="color: gray;">body line</b>
> Ah giusto! hai copiato da me, non mi ricordavo. <b style="color: gray;">body line</b>
> Quest'immagine rappresenta la tua vita: \[base64 encoded data\] (immagine bianca) <b style="color: gray;">body line</b>
> A presto, <b style="color: gray;">body line</b>
> Giulio. <b style="color: gray;">body line</b>

---
### PROTOCOLLI DI ACCESSO ALLA POSTA

Poiché SMTP è un protocollo push (la connessione TCP è avviata solo da chi vuole inviare), il MAA implementa protocolli dedicati per consentire allo UA di recuperare i messaggi dal server:

---
#### Protocollo POP3

**POP3** (Post Office Protocol versione 3, RFC 1939) è un protocollo **stateless** (senza memoria di stato) che opera sulla porta 110. Stabilita la connessione TCP, procede in tre fasi:

- **Autorizzazione:** il client invia nome utente e password per autenticarsi.
- **Transazione**: il client recupera i messaggi tramite i comandi **list** (restituisce l'elenco dei messaggi presenti nella mailbox con la relativa dimensione in byte), **retr** (scarica il messaggio), **dele** (marca il messaggio da eliminare). Il server risponde con **+OK** in caso di successo o **-ERR** in caso di errore.
- **Aggiornamento**: dopo il comando **quit**, il server rimuove definitivamente i messaggi marcati per la cancellazione.

> [!example]
> Nel dialogo che segue, C: (client) è lo user agent e S: è il mail server. La transazione sarà: 
> C: list <b style="color: gray;">restituisce la lista di messaggi</b>
> S: 1 498 
> S: 2 912 
> S: . 
> C: retr 1 <b style="color: gray;">scarica il messaggio 1</b>
> S: (inizio messaggio ... 
> S: ................. 
> S: ..........fine messaggio) 
> S: . 
> C: dele 1 <b style="color: gray;">marca il messaggio 1 come da eliminare</b>
> C: retr 2 <b style="color: gray;">scarica il messaggio 2</b>
>S: (inizio messaggio ... 
> S: ................. 
> S: ..........fine messaggio) 
> S: . 
> C: dele 2 <b style="color: gray;">marca il messaggio 2 come da eliminare</b>
> C: quit <b style="color: gray;">chiudi la connessione e elimina i messaggi marcati</b>
> S: +OK POP3 server signing off

POP3 supporta due modalità operative: nella modalità **scarica e cancella** i messaggi vengono rimossi dal server dopo il download, impedendo l'accesso da più dispositivi. Nella modalità **scarica e mantieni** i messaggi restano sul server. In entrambi i casi, POP3 non mantiene stato tra sessioni diverse e non consente la creazione di cartelle remote, limitando l'organizzazione dei messaggi al solo livello locale.

---
#### Protocollo IMAP

**IMAP** (Internet Message Access Protocol, RFC 3501) è un protocollo **stateful** (con memoria di stato) che opera sulla porta 143. A differenza di POP3, tutti i messaggi vengono conservati sul mail server e l'utente dispone solo di copie locali. IMAP offre funzionalità avanzate:

- associazione di ogni messaggio ricevuto a una cartella (inbox);
- creazione di cartelle remote e spostamento di messaggi tra di esse;
- ricerca nelle cartelle remote;
- conservazione dello stato tra sessioni diverse (nomi delle cartelle, associazione messaggi-cartelle).

È inoltre possibile scaricare solo parti di un messaggio (ad esempio la sola intestazione), funzione utile in presenza di connessioni a bassa larghezza di banda.

---
### WEBMAIL

**HTTP** viene utilizzato dalla posta basata sul web (webmail). In questo caso il browser funge da UA e la comunicazione tra UA e MAA avviene tramite HTTP sia in ricezione sia in invio, mentre la comunicazione tra MTA rimane basata su SMTP (in altre parole L’utente comunica con il suo mailbox mediante HTTP ma SMTP rimane il protocollo di comunicazione tra mail server).

---

