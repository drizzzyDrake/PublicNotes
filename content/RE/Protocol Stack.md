Per gestire la complessità dei sistemi di comunicazione, i progettisti organizzano protocolli, hardware e software in **livelli (layer)** gerarchici. Questo approccio segue il principio del **divide et impera**: un compito complesso viene suddiviso in sotto-compiti più semplici.

> Un protocollo definisce l’insieme di regole che il dispositivo mittente e il dispositivo destinatario, così come tutti i sistemi intermedi coinvolti, devono rispettare per essere in grado di comunicare.

---
### CARATTERISTICHE

**Indipendenza (Modularità):** ogni livello è una "black box". Conosce i suoi ingressi e uscite, ma non come il livello adiacente elabori i dati internamente.

**Modello di Servizio:** il livello $\large n$ utilizza i servizi del livello inferiore ($\large{n-1}$) per offrire un servizio a valore aggiunto al livello superiore ($\large{n+1}$). 

**Comunicazione Logica:** esiste un collegamento logico tra livelli equivalenti **(peer-to-peer)**. Il livello $\large{n}$ del mittente comunica virtualmente solo con il livello $\large{n}$ del destinatario, seguendo le regole di un protocollo specifico.

---
### STACK PROTOCOLLARE TCP/IP

È lo standard de facto delle reti moderne. Si compone di **5 livelli**, ognuno con funzioni e unità di misura dei pacchetti **(PDU, Protocol Data Unit)** specifiche:
#### [[Application Layer]]

#### [[Transport Layer]]

#### [[Network Layer]]
#### 4. Livello di Collegamento

Si occupa di trasferire i pacchetti, chiamati **frame**, da un nodo (host o router) a quello immediatamente successivo lungo il percorso.

- **Servizi:** dipendono dal protocollo usato (es. **Ethernet, Wi-Fi, PPP**). Un datagramma può essere trasportato da protocolli diversi in tratte diverse del suo viaggio.

> N.B. Può fornire una consegna affidabile point-to-point, diversa da quella end-to-end del TCP.

---
#### 5. Livello Fisico

È il livello di base che si occupa del trasferimento dei **singoli bit** all'interno di un frame da un nodo al successivo.

- **Dipendenza:** I protocolli dipendono strettamente dal [[Network#LINK|mezzo trasmissivo]] utilizzato (fibra ottica, doppino di rame, onde radio, ecc.). Esempio: ethernet ha protocolli fisici diversi a seconda che si usi un cavo coassiale o la fibra.

---
#### Tabella riassuntiva

|**Livello**|**Nome PDU**|**Funzione Principale**|**Protocolli Comuni**|**Implementazione**|
|---|---|---|---|---|
|**Applicazione**|Messaggio|Supporto alle app di rete.|HTTP, SMTP, DNS, FTP|Software (Host)|
|**Trasporto**|Segmento|Trasferimento processo-a-processo.|TCP, UDP|Software (Host)|
|**Rete**|Datagramma|Instradamento (routing) da origine a destinazione.|IP|Mista (Hw/Sw)|
|**Collegamento**|Frame|Trasmissione tra nodi adiacenti.|Ethernet, Wi-Fi, PPP|Hardware (NIC)|
|**Fisico**|Bit|Trasferimento fisico dei singoli bit sul mezzo.|-|Hardware|

---
### PROCESSO DI COMUNICAZIONE

Quando un dato viene inviato, attraversa lo stack dall'alto verso il basso nel mittente e dal basso verso l'alto nel destinatario.

![[encapsulation.png]]

> N.B. I nodi intermedi non lavorano su tutti i livelli: gli **switch** solitamente lavorano fino al livello di collegamento, mentre i **router** lavorano fino al livello di rete (cambio di rete, edge router) per decidere il percorso dei datagrammi.

---
#### Incapsulamento e Decapsulamento

 I dati vengono impacchettati mentre scendono lungo lo stack protocollare (incapsulamento) e spacchettati mentre risalgono (decapsulamento):
 
---
##### Incapsulamento

Ogni livello dello stack aggiunge informazioni specifiche sotto forma di **intestazione (header)** ai dati che riceve dal livello superiore. Il pacchetto risultante è composto quindi da due parti:

- **Header (intestazione):** contiene i dati di controllo (es. indirizzi, rilevamento errori).
- **Payload (carico utile):** è l'intero pacchetto proveniente dal livello superiore.

Il **livello applicazione** genera il **messaggio** originale $\large M$. Il **livello trasporto** aggiunge l'header $\large{H_t}$ (es. per identificare l'app di destinazione), creando il **segmento**. Il **livello rete** aggiunge l'header $\large{H_n}$ (es. indirizzi IP sorgente e destinazione), creando il **datagramma**. infine il **livello collegamento** aggiunge l'header $\large {H_l}$ (es. indirizzo fisico del dispositivo che sta trasmettendo), creando il **frame**.

---
##### Decapsulamento

Il decapsulamento è il processo inverso che avviene sul dispositivo di destinazione: mentre i dati risalgono lo stack, ogni livello analizza e rimuove l'header di propria competenza per elaborare le informazioni di controllo. Al termine di ogni passaggio, il livello inoltra il payload pulito al livello superiore, finché l'applicazione riceve il messaggio originale esattamente come era stato spedito.

---
#### Multiplexing e Demultiplexing

Oltre all'aggiunta e rimozione degli header, ogni livello deve gestire il fatto che possono esistere più protocolli contemporaneamente. 

![[multiplexing demultiplexing.png]]

---
##### Multiplexing

Mentre i dati scendono lungo lo stack, un protocollo a un livello inferiore deve essere in grado di raccogliere i messaggi provenienti da **diversi protocolli** del livello superiore, al fine di permettere a un unico canale di comunicazione di trasportare dati di natura diversa (web, email, chat) simultaneamente.

---
##### Demultiplexing

Mentre i dati risalgono lo stack, ogni livello deve decidere a quale protocollo superiore consegnare il **payload** estratto. Una volta effettuato il **decapsulamento** (rimozione dell'header), il livello esamina il campo identificativo che era stato inserito (nell'header) in fase di invio. In base a quel valore, smista il pacchetto al protocollo corretto del livello superiore.

---
### MODELLO OSI

Il **modello OSI (Open Systems Interconnection)** è il riferimento teorico a **7 livelli** standardizzato dall'**ISO**. È nato per definire un'architettura di rete aperta, permettendo a sistemi diversi di comunicare.

---
#### I Livelli Aggiuntivi (rispetto al TCP/IP)

Mentre il modello TCP/IP accorpa tutto ciò che riguarda l'interazione con l'utente nel livello **applicazione**, l'OSI separa queste funzioni in tre strati distinti:

- **Livello 7 - Applicazione (Application Layer):** come nel TCP/IP.
- **Livello 6 - Presentazione (Presentation Layer):** gestione della sintassi e della semantica delle informazioni trasferite. Traduzione dei codici (es. da EBCDIC ad ASCII), **compressione** dei dati per ridurre il volume di traffico e **cifratura** (crittografia) per la sicurezza. In breve, assicura che il destinatario possa leggere i dati inviati.
- **Livello 5 - Sessione (Session Layer):** gestione e controllo delle connessioni (sessioni) tra computer. Controllo del dialogo (stabilire chi deve trasmettere e quando), **sincronizzazione** tramite l'inserimento di checkpoint nel flusso di dati. Se la connessione cade, il trasferimento può riprendere dall'ultimo punto di controllo invece di ricominciare da zero.

Tutti gli altri livelli (Trasporto, Rete, Collegamento e Fisico) sono gli stessi del modello TCP/IP.

---

