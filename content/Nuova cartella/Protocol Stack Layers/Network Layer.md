Il **livello di rete** ha il compito fondamentale di permettere il trasferimento dei pacchetti da un host sorgente a un host destinazione attraverso una rete composta da molti router intermedi. A questo livello è l'unità fondamentale di informazione che viene instradata attraverso la rete prende il nome di **datagramma**.

---
### DATA DELIVERY

Il livello di rete ha come obiettivo principale il trasferimento dei pacchetti da un host a un altro. Per svolgere questa funzione, si distinguono due operazioni fondamentali: **inoltro** e **instradamento**, spesso considerate sinonimi nella letteratura, ma concettualmente diverse.

---
#### Inoltro (forwarding)

L'inoltro (o forwarding) è l’operazione locale con cui un router, ricevuto un pacchetto su un’interfaccia di ingresso, lo trasferisce sull’interfaccia di uscita appropriata. Questa decisione viene presa consultando la **tabella di inoltro** (forwarding table), che associa valori dell’intestazione del pacchetto a specifici collegamenti di uscita.

- L’inoltro avviene in tempi rapidissimi (nanosecondi).
- È implementato tipicamente in **hardware**.
- La Figura 4.2 mostra un router che, ricevuto un pacchetto con intestazione _0110_, consulta la tabella di inoltro e lo invia sull’interfaccia _2_.

---
#### Instradamento (routing)

L’instradamento è il processo globale che determina i percorsi che i pacchetti devono seguire dalla sorgente alla destinazione. È realizzato tramite **algoritmi di routing**, che calcolano le informazioni necessarie per popolare le tabelle di inoltro dei router.

- L’instradamento opera su tempi più lunghi (secondi).
- È implementato in **software**.

---
### PIANO DI CONTROLLO

Il **piano di controllo** (control plane) rappresenta la componente del livello di rete responsabile delle decisioni “intelligenti” che determinano come i pacchetti debbano essere instradati attraverso la rete. A differenza del piano dei dati, che si limita a inoltrare i pacchetti in modo rapido e locale, il piano di controllo opera su una scala temporale più ampia e si occupa di calcolare i percorsi, aggiornare le informazioni di rete e garantire che ogni router disponga delle corrette regole di inoltro. 

---
#### Modello tradizionale

Nel modello tradizionale, questa logica è distribuita: ogni router esegue localmente il proprio algoritmo di instradamento e comunica con gli altri router per costruire una visione coerente della topologia. Attraverso protocolli di routing, i router scambiano informazioni e aggiornano autonomamente le proprie tabelle di inoltro, integrando sia la funzione di instradamento sia quella di inoltro all’interno dello stesso dispositivo. Questo approccio, adottato per molti anni, ha garantito robustezza e autonomia alla rete, ma comporta complessità nella gestione e nella riconfigurazione.

IMMAGINE

---
#### Modello SDN

Un’alternativa più recente al modello tradizionale è rappresentata dal paradigma **Software-Defined Networking (SDN)**, che separa fisicamente il piano di controllo dal piano dei dati. In questo modello, i router non eseguono più algoritmi di instradamento: si limitano a inoltrare i pacchetti secondo le regole ricevute. L’intelligenza della rete è concentrata in un **controller remoto**, un’entità centralizzata che calcola e distribuisce le tabelle di inoltro a tutti i dispositivi. La comunicazione tra controller e router avviene tramite messaggi contenenti le regole di forwarding e altre informazioni di gestione. Questo controller può risiedere in un data center affidabile e ridondato, ed è spesso implementato in software open source, favorendo innovazione, programmabilità e una gestione più flessibile della rete. 

IMMAGINE

---
