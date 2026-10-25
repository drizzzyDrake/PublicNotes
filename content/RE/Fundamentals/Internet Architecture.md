**Internet** è una **rete di reti**, ossia un'infrastruttura globale, pubblica e decentralizzata che interconnette milioni di reti in tutto il mondo. La comunicazione tra dispositivi eterogenei è resa possibile dall'insieme di protocolli **TCP/IP**, che definisce regole comuni per lo scambio dei dati indipendentemente dalla posizione geografica o dall'hardware utilizzato. Dal punto di vista architetturale, Internet è suddivisa in tre principali aree logiche:

![[network example.png]]

---
### NETWORK EDGE

L'**Edge** rappresenta la periferia di Internet ed è costituito dai **[[Network Basics#Sistemi Terminali (End Systems)|sistemi terminali]]**, ovvero i dispositivi che eseguono le applicazioni e generano o ricevono i dati scambiati sulla rete.

![[network edge.png]]

---
### ACCESS NETWORK

L'**Access Network** rappresenta l'infrastruttura che collega i sistemi terminali al **primo router** del percorso, chiamato **edge router**, consentendo l'accesso a Internet. Comprende i mezzi trasmissivi, i dispositivi di accesso e le tecnologie utilizzate per stabilire la connessione con il provider. Le soluzioni adottate si articolano in tre grandi categorie: 

![[network access.png]]

---
##### Reti di Accesso Residenziale

All'interno dell'abitazione, il **modem** (via cavo o DSL) è tipicamente collegato a un router domestico che svolge funzioni di routing, firewall e NAT (Network Address Translation). Il router distribuisce la connettività ai dispositivi della casa attraverso due canali: una connessione Ethernet cablata, con velocità fino a 1 Gbps, e un access point Wi-Fi che supporta velocità di 54 o 450 Mbps a seconda dello standard adottato. Nella pratica, tutte queste funzionalità (modem, router, firewall e access point) sono spesso integrate in un unico dispositivo combinato fornito dall'operatore. 

![[home network.png]]

Le reti di accesso residenziali collegano le abitazioni private all'infrastruttura di Internet. Le due tecnologie di accesso più diffuse in questo ambito sono:

---
###### Accesso via Cavo (HFC)

L'accesso via cavo sfrutta la rete di distribuzione televisiva via cavo per trasmettere sia segnali televisivi che dati Internet. L'architettura di riferimento è quella **HFC** (Hybrid Fibre-Coaxial), che combina tratti in [[Network Basics#Cavo in fibra ottica|fibra ottica]] dalla centrale, detta **cable headend**, fino ai quartieri, con tratti finali in [[Network Basics#Cavo coassiale|cavo coassiale]] che arrivano nelle singole abitazioni. La trasmissione avviene attraverso il **multiplexing a divisione di frequenza** (FDM, Frequency Division Multiplexing): dati, segnali televisivi e canali di controllo vengono trasmessi simultaneamente sullo stesso cavo, ciascuno su una diversa banda di frequenza. All'interno delle abitazioni è presente uno **splitter** che separa il segnale dati da quello televisivo, instradando il primo verso il modem via cavo.

![[cable access.png]]

Le velocità di trasmissione sono asimmetriche: in **downstream** (dalla rete all'utente) si raggiungono velocità fino a 40 Mbps - 1,2 Gbps, mentre in **upstream** (dall'utente alla rete) la banda disponibile è di 30 - 100 Mbps. Un aspetto rilevante è che la rete di accesso è condivisa: tutte le abitazioni di un quartiere condividono lo stesso segmento di cavo coassiale fino al cable headend, il che implica che la banda effettiva disponibile per ciascun utente può variare in funzione del numero di utenti attivi contemporaneamente.

---
###### Digital Subscriber Line (DSL)

La tecnologia DSL utilizza la linea telefonica in rame già esistente per trasmettere dati digitali ad alta velocità, consentendo la coesistenza di traffico dati e voce sullo stesso [[Network Basics#Doppino intrecciato|doppino]]. Nelle abitazioni, uno **splitter ADSL** separa i due segnali: la voce viene instradata verso la rete telefonica tradizionale (PSTN), mentre i dati sono convogliati verso il **modem ADSL** e da li verso il **DSLAM** (DSL Access Multiplexer) presso la centrale telefonica locale, che li immette su Internet.

![[dsl access.png]]

A differenza dell'accesso via cavo, la linea DSL è dedicata: ogni utente dispone di un collegamento fisico proprio verso la centrale, senza condivisione del mezzo con altri abbonati. Le velocità di trasmissione in tecnologia ADSL raggiungono 24 - 52 Mbps in **downstream** e 3,5 - 16 Mbps in **upstream**. Anche in questo caso l'accesso è asimmetrico, con una banda maggiore dedicata alla ricezione dei dati.

---
##### Reti di Accesso Wireless

Le reti di accesso [[Network Basics#Supporti non guidati|wireless]] consentono ai dispositivi terminali di connettersi alla rete senza l'utilizzo di cavi fisici, attraverso una stazione base, comunemente denominata **access point**, che funge da punto di raccordo tra i dispositivi e il router. Si distinguono principalmente due tipologie: 

---
###### Reti Locali Senza Fili (WLAN / WiFi)

Le reti WLAN operano tipicamente in ambienti confinati, come all'interno o nelle immediate vicinanze di un edificio, con una copertura che si estende fino a circa 30 metri. Lo standard di riferimento è IEEE 802.11, nelle sue varianti principali (802.11b offre velocità fino a 11 Mbps, 802.11g arriva a 54 Mbps e 802.11n raggiunge i 450 Mbps). Queste reti forniscono connettività condivisa tra tutti i dispositivi associati allo stesso access point.

---
###### Reti Cellulari Wide-Area (4G/5G)

Le reti cellulari wide-area sono gestite dagli operatori di telefonia mobile e offrono copertura su aree geografiche molto estese, nell'ordine delle decine di chilometri per singola cella. Le reti di quarta generazione (4G LTE) garantiscono velocità nell'ordine delle decine di Mbps, mentre le reti 5G promettono prestazioni significativamente superiori in termini di velocità, latenza e capacità. A differenza del WiFi, l'accesso cellulare è progettato per garantire mobilità continua anche quando l'utente si sposta tra celle diverse.

![[metropolitan network.png]]
  
---
##### Reti di Accesso Istituzionali e Aziendali

Le reti di accesso istituzionali (utilizzate in aziende, università, scuole e altri enti) presentano un'architettura più articolata rispetto a quella domestica, progettata per supportare un numero elevato di utenti e garantire elevate prestazioni e affidabilità. La presenza congiunta di **switch** e **router** consente di strutturare la rete in modo gerarchico e segmentato, migliorando sia le prestazioni, grazie alla riduzione dei domini di collisione e broadcast, sia la sicurezza, mediante la separazione logica dei diversi segmenti di rete (es. rete amministrativa, rete ospiti...). 

![[corporate network.png]]

Dal punto di vista tecnologico, queste reti impiegano un mix di soluzioni [[Network Basics#Supporti guidati|cablate]] e [[Network Basics#Supporti non guidati|wireless]], interconnesse attraverso switch ed router. Sul fronte cablato, la tecnologia dominante è Ethernet, disponibile in tre varianti principali: a 100 Mbps (Fast Ethernet), a 1 Gbps (Gigabit Ethernet) e a 10 Gbps (10-Gigabit Ethernet). Sul fronte wireless, la rete è coperta da access point WiFi distribuiti negli ambienti, che supportano velocità di 11, 54 o 450 Mbps a seconda dello standard impiegato.

---
### NETWORK CORE

Il **Network Core** costituisce il nucleo di Internet ed è formato dall'insieme dei **router** e dei **collegamenti ad alta capacità** (backbone) che interconnettono le reti di accesso su scala globale. Il suo compito è inoltrare i dati tra reti differenti in modo efficiente, affidabile e scalabile, attraverso meccanismi di instradamento e commutazione.

![[network core.png]]

Per comprendere il funzionamento del network core è necessario analizzare sia le tecniche di inoltro dei dati (commutazione di pacchetto e di circuito), sia le principali metriche utilizzate per valutarne le prestazioni, come throughput, delay e intensità di traffico.

---
#### Commutazione di pacchetto

Nella commutazione di pacchetto, i dati da trasmettere vengono suddivisi in unità discrete chiamate **pacchetti** (packets). Ciascun pacchetto viene inoltrato in modo indipendente da un router all'altro lungo il percorso che va dall'origine alla destinazione, seguendo i collegamenti disponibili nella rete.

![[forwarding and routing.png]]

---
##### Store-and-forward

Il principio fondamentale su cui si basa questa modalità è il **store-and-forward**: ogni router deve ricevere e memorizzare l'intero pacchetto prima di poterlo ritrasmettere sul collegamento successivo. Il pacchetto non può essere inoltrato "al volo" durante la ricezione, ma deve attendere di essere completamente acquisito dal nodo intermedio. Questo meccanismo introduce una latenza di elaborazione ad ogni salto, ma garantisce che il nodo possa verificare l'integrità del pacchetto prima di trasmetterlo.

![[store and forward.png]]

---
##### Code e perdita di pacchetti

Un aspetto critico della commutazione di pacchetto riguarda la gestione delle situazioni di congestione. Se la velocità di ricezione dei pacchetti su un'interfaccia di ingresso supera la velocità di trasmissione disponibile sull'interfaccia di uscita, i pacchetti in eccesso vengono temporaneamente accodati in un buffer, in attesa di essere trasmessi. Tuttavia, la capacità del buffer è finita. Se il buffer raggiunge la sua capienza massima, i pacchetti in arrivo non possono essere memorizzati e vengono **scartati** (packet loss). I pacchetti persi possono, se necessario, essere ritrasmessi dal mittente originale, tipicamente grazie a meccanismi di controllo degli errori a livello di trasporto, come quelli del protocollo TCP. 

![[packet loss.png]]

---
##### Bandwidth $\displaystyle B$

La **larghezza di banda** (bandwidth), che indichiamo con $\displaystyle B$, è la quantità, espressa in Hz, che rappresenta l'ampiezza dell'intervallo di frequenze utilizzato dal sistema trasmissivo. Maggiore è tale valore, maggiore è la quantità di informazione veicolabile attraverso il mezzo fisico.

---
##### Transmission Rate $\displaystyle R$

Il **transmission rate** (o bit rate), che indichiamo con $\displaystyle R$, è la quantità (espressa in b/s) di bit al secondo che un link garantisce di trasmettere. Tale quantità è proporzionale alla larghezza di banda (in Hz).

---
##### Throughput $\displaystyle T$

Il throughput, che indichiamo con $\displaystyle T$, misura la quantità effettiva di dati (in b/s) che transitano attraverso un nodo o un percorso della rete in un dato intervallo di tempo. A differenza del transmission rate, che è una caratteristica del link, il throughput dipende dalle condizioni reali della rete: carico, congestione, interferenze. Per un trasferimento di $\displaystyle F$ bit completato in $\displaystyle t$ secondi, il throughput medio è $\displaystyle T = \frac{F}{t}$

> N.B. A differenza del transmission rate, il quale fornisce una misura della potenziale velocità di un link, il throughput fornisce una misura dell’effettiva velocità di un link. In generale, dunque, si ha che $\displaystyle T < R$.

---
##### Bottleneck

In un percorso end-to-end composto da più link in serie, il throughput complessivo non è determinato dal link più veloce, bensì da quello più lento, detto **collo di bottiglia**. 

![[bottleneck.png]]
 
> Il link 2 risulta essere il collo di bottiglia di tale percorso, limitando il throughput del percorso a 100 kb/s

---
##### Traffic Intensity $\displaystyle I$

L'intensità di traffico è un numero puro (adimensionale) che misura il **grado di impegno di un link** o di una risorsa di rete. Serve a prevedere l'entità del delay di queueing $\displaystyle D_q$. Siano $\displaystyle L$ la **dimensione media di un pacchetto** (in bit), $\displaystyle a$ **la frequenza media di arrivo dei pacchetti** (pacchetti/secondo) e $\displaystyle R$ il **transmission rate** (bps), l'intensità di traffico è definita come: $\displaystyle I = \frac{L \times a}{R} = D_t \times a$. 

- $\displaystyle I \to 0$ : il traffico è scarso, il ritardo di coda è quasi nullo.
- $\displaystyle I \to 1$ : il traffico si avvicina alla capacità massima del link. Il ritardo di coda cresce in modo esponenziale (tende all'infinito).
- $\displaystyle I \gt 1$ : il sistema è instabile. Arrivano più bit di quanti il link possa trasmetterne. Le code esplodono e si verificano perdite di pacchetti (packet loss).

---
##### Delay di un pacchetto $\displaystyle D$

Il tempo totale necessario a un pacchetto per attraversare un nodo o un intero percorso di rete è detto latenza (o delay). Il delay totale subito da un pacchetto in corrispondenza di un singolo nodo è la somma delle quattro componenti: $\displaystyle D = D_e + D_q + D_t + D_p$

![[dalay.png]]

---

**Delay end-to-end**

Su un percorso con $\displaystyle N$ link (e quindi $\displaystyle N-1$ router intermedi), nell'ipotesi di rete non congestionata ($\displaystyle D_q \approx 0$) e parametri omogenei su tutti i nodi, il delay totale end-to-end è:

$\displaystyle D_{e2e} = N \cdot (D_e + D_t + D_p) = N \cdot \left(D_e + \frac{L}{R} + \frac{k}{v}\right)$

In presenza di accodamento e parametri eterogenei tra i nodi, il delay end-to-end si ottiene invece sommando le quattro componenti per ciascun nodo attraversato:

$\displaystyle D_{e2e} = \sum_{i=1}^{N} \left(D_{e_i} + D_{q_i} + D_{t_i} + D_{p_i}\right)$

---
##### Delay di elaborazione $\displaystyle D_e$

È il tempo impiegato dal nodo per esaminare l'intestazione del pacchetto, verificarne l'integrità e determinare l'interfaccia di uscita corretta. Dipende dalla velocità di calcolo del router e dalla complessità delle operazioni svolte. Tipicamente dell'ordine dei microsecondi nei router moderni.

---
##### Delay di queueing $\displaystyle D_q$

È il tempo che il pacchetto trascorre in attesa nella coda di uscita del nodo, prima di poter essere trasmesso sul link. Dipende dal carico istantaneo della rete: se la coda è vuota il delay è nullo, se è congestionata può diventare la componente dominante. È la componente più variabile e imprevedibile.

---
##### Delay di trasmissione $\displaystyle D_t$

È il tempo necessario al nodo per **immettere fisicamente tutti i bit del pacchetto sul link**. Dipende dalla **dimensione del pacchetto** $\displaystyle L$ (in bit) e dal **transmission rate** $\displaystyle R$ del link: $\displaystyle D_t = \frac{L}{R}$

---
##### Delay di propagazione $\displaystyle D_p$

È il tempo impiegato dall'**ultimo bit trasmesso** per propagarsi fisicamente da un nodo all'altro. Dipende dalla **lunghezza del link** $\displaystyle k$ e dalla **velocità di propagazione del segnale $\displaystyle v$** nel mezzo (che dipende dal tipo di mezzo): $\displaystyle D_p = \frac{k}{v}$ ($\displaystyle D_p = \frac{\text{RTT}}{2}$)

---
##### Bandwidth-Delay Product $\displaystyle B_{max}$

Il prodotto tra il **transmission rate $R$** di un link e il suo **delay di propagazione** $\displaystyle D_p$ fornisce una quantità importante: il **massimo numero di bit che possono trovarsi contemporaneamente "in transito" sul link** in un dato istante. $\displaystyle B_{max} = R \times D_p$

> Questa grandezza rappresenta la **capacità volumetrica** del link: quanti bit possono essere distribuiti lungo il cavo nello stesso momento. È utile per dimensionare i buffer e per ragionare sull'efficienza dei protocolli di controllo del flusso.

---
#### Commutazione di circuito

Nella commutazione di circuito, prima che la comunicazione tra due nodi abbia inizio, viene stabilito un circuito dedicato, ovvero viene riservata in anticipo una porzione delle risorse della rete (banda, slot temporali) per tutta la durata della sessione. Questo approccio è tipico delle reti telefoniche tradizionali.

---

**Affidabilità e inefficienza:**

Il vantaggio principale è la garanzia di qualità del servizio: poiché le risorse sono riservate, non si verificano code né perdite di dati durante la trasmissione. Lo svantaggio è la scarsa efficienza nell'uso delle risorse: se i due interlocutori non stanno trasmettendo in un dato momento, le risorse riservate rimangono inutilizzate. Inoltre, il numero massimo di comunicazioni simultanee supportate dalla rete è strettamente limitato dal numero di circuiti che è possibile riservare. 

---
