**Internet è una rete che collega le [[Network|reti]]**, il nome stesso deriva da inter-networking. È una "rete di reti" globale, pubblica e decentralizzata che utilizza un linguaggio comune chiamato **protocollo TCP/IP** per permettere a miliardi di dispositivi di comunicare tra loro, indipendentemente da dove si trovino o da che tipo di hardware utilizzino.

---
### ZONE DI INTERNET

La rete globale è divisa fondamentalmente in tre grandi aree logiche:

![[network example.png]]

---
#### Edge (Periferia)

Qui troviamo esclusivamente i **Sistemi Terminali ([[Network#Sistemi Terminali (End Systems)|End Systems]])**. Non smistano traffico per altri, ma eseguono solo applicazioni.

![[network edge.png]]

---
#### Access Network (Rete di Accesso)

È la zona di transizione. Qui i componenti consentono l'accesso a Internet (link, modem, switch e **edge router**, il primo router del percorso).

![[network access.png]]

---

Le reti di accesso rappresentano l'infrastruttura che consente ai sistemi periferici (host) di connettersi al cosiddetto **edge router**, ovvero il primo router del percorso che collega un dispositivo finale a qualsiasi altra destinazione remota nella rete. Le soluzioni adottate si articolano in tre grandi categorie: 

---
##### Reti di Accesso Residenziale

All'interno dell'abitazione, il **modem** (via cavo o DSL) è tipicamente collegato a un router domestico che svolge funzioni di routing, firewall e NAT (Network Address Translation). Il router distribuisce la connettività ai dispositivi della casa attraverso due canali: una connessione Ethernet cablata, con velocità fino a 1 Gbps, e un access point Wi-Fi che supporta velocità di 54 o 450 Mbps a seconda dello standard adottato. Nella pratica, tutte queste funzionalità (modem, router, firewall e access point) sono spesso integrate in un unico dispositivo combinato fornito dall'operatore. 

![[home network.png]]

Le reti di accesso residenziali collegano le abitazioni private all'infrastruttura di Internet. Le due tecnologie di accesso più diffuse in questo ambito sono:

---
###### Accesso via Cavo (HFC)

L'accesso via cavo sfrutta la rete di distribuzione televisiva via cavo per trasmettere sia segnali televisivi che dati Internet. L'architettura di riferimento è quella **HFC** (Hybrid Fibre-Coaxial), che combina tratti in [[Network#Cavo in fibra ottica|fibra ottica]] dalla centrale, detta **cable headend**, fino ai quartieri, con tratti finali in [[Network#Cavo coassiale|cavo coassiale]] che arrivano nelle singole abitazioni. La trasmissione avviene attraverso il **multiplexing a divisione di frequenza** (FDM, Frequency Division Multiplexing): dati, segnali televisivi e canali di controllo vengono trasmessi simultaneamente sullo stesso cavo, ciascuno su una diversa banda di frequenza. All'interno delle abitazioni è presente uno **splitter** che separa il segnale dati da quello televisivo, instradando il primo verso il modem via cavo.

![[cable access.png]]

Le velocità di trasmissione sono asimmetriche: in **downstream** (dalla rete all'utente) si raggiungono velocità fino a 40 Mbps - 1,2 Gbps, mentre in **upstream** (dall'utente alla rete) la banda disponibile è di 30 - 100 Mbps. Un aspetto rilevante è che la rete di accesso è condivisa: tutte le abitazioni di un quartiere condividono lo stesso segmento di cavo coassiale fino al cable headend, il che implica che la banda effettiva disponibile per ciascun utente può variare in funzione del numero di utenti attivi contemporaneamente.

---
###### Digital Subscriber Line (DSL)

La tecnologia DSL utilizza la linea telefonica in rame già esistente per trasmettere dati digitali ad alta velocità, consentendo la coesistenza di traffico dati e voce sullo stesso [[Network#Doppino intrecciato|doppino]]. Nelle abitazioni, uno **splitter ADSL** separa i due segnali: la voce viene instradata verso la rete telefonica tradizionale (PSTN), mentre i dati sono convogliati verso il **modem ADSL** e da li verso il **DSLAM** (DSL Access Multiplexer) presso la centrale telefonica locale, che li immette su Internet.

![[dsl access.png]]

A differenza dell'accesso via cavo, la linea DSL è dedicata: ogni utente dispone di un collegamento fisico proprio verso la centrale, senza condivisione del mezzo con altri abbonati. Le velocità di trasmissione in tecnologia ADSL raggiungono 24 - 52 Mbps in **downstream** e 3,5 - 16 Mbps in **upstream**. Anche in questo caso l'accesso è asimmetrico, con una banda maggiore dedicata alla ricezione dei dati.

---
##### Reti di Accesso Wireless

Le reti di accesso [[Network#Supporti non guidati|wireless]] consentono ai dispositivi terminali di connettersi alla rete senza l'utilizzo di cavi fisici, attraverso una stazione base, comunemente denominata **access point**, che funge da punto di raccordo tra i dispositivi e il router. Si distinguono principalmente due tipologie: 

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

Dal punto di vista tecnologico, queste reti impiegano un mix di soluzioni [[Network#Supporti guidati|cablate]] e [[Network#Supporti non guidati|wireless]], interconnesse attraverso switch ed router. Sul fronte cablato, la tecnologia dominante è Ethernet, disponibile in tre varianti principali: a 100 Mbps (Fast Ethernet), a 1 Gbps (Gigabit Ethernet) e a 10 Gbps (10-Gigabit Ethernet). Sul fronte wireless, la rete è coperta da access point WiFi distribuiti negli ambienti, che supportano velocità di 11, 54 o 450 Mbps a seconda dello standard impiegato.

---
#### Core (Nucleo)

La porzione centrale di un'architettura di rete, progettata per l'instradamento ad alta velocità dei dati tra le varie sottoreti periferiche (contiene router di core, link di backbone e ISP nazionali/globali).

![[network core.png]]

---