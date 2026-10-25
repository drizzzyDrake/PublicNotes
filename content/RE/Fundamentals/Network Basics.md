Una rete è un’infrastruttura composta da dispositivi detti **nodi** della rete in grado di scambiarsi informazioni tramite dei mezzi di comunicazione, wireless o cablati, detti **link**.

![[nodes.png]]

---
### NODI DELLA RETE 

I **nodi** sono i dispositivi che costituiscono una rete e partecipano allo scambio di dati. In base al ruolo svolto nella comunicazione, si distinguono in **sistemi terminali** e **dispositivi di interconnessione**:

---
#### Sistemi Terminali (End Systems)

Situati ai margini della rete (**network edge**), sono i dispositivi che ospitano le applicazioni e interagiscono direttamente con l'utente o con altri servizi.

- **Host (Client):** dispositivi finali, ad esempio i computer, che iniziano richieste di servizio o eseguono applicazioni locali. 
- **Server:** sistemi ad alte prestazioni e alta disponibilità progettati per rispondere alle richieste dei client. Forniscono risorse condivise, dati o servizi computazionali (es. Web server, Database server).

---
#### Dispositivi di Interconnessione (Intermediate Systems)

I **dispositivi di interconnessione** sono i nodi che non generano né consumano dati, ma hanno il compito di inoltrarli tra i sistemi terminali. A seconda del contesto, operano nella **rete di accesso** o nel **core** garantendo l'instradamento e la consegna delle informazioni.

- **Router:** dispositivi che instradano i pacchetti tra reti differenti basandosi sull'indirizzamento IP. Determinano il percorso ottimale verso la destinazione attraverso tabelle e protocolli di routing. Costituiscono i principali elementi del **Network Core**.
- **Switch:** dispositivi che collegano i nodi di una stessa rete locale (LAN). Inoltrano i frame utilizzando gli indirizzi MAC, riducendo le collisioni e migliorando l'efficienza della comunicazione. Operano principalmente nella **rete di accesso** e nelle reti locali.
- **Modem (Modulatore/Demodulatore):** dispositivo che converte i segnali tra il dominio digitale della rete locale e il mezzo trasmissivo utilizzato dal provider (rame, fibra o rete via cavo), consentendo l'accesso a Internet. È un componente della **Access Network**.

---
### LINK DELLA RETE

Alla base di qualsiasi sistema di comunicazione digitale vi è il bit, l'unità elementare di informazione, che si propaga fisicamente tra un trasmettitore e un ricevitore attraverso un mezzo trasmissivo. Il collegamento fisico è dunque il substrato concreto che rende possibile questa propagazione. I supporti fisici si dividono in guidati e non guidati, in base alla natura del mezzo attraverso cui il segnale si propaga.

--- 
#### Supporti guidati

I supporti guidati comprendono tutte le tecnologie di trasmissione basate su cavi fisici. Ogni tipologia si distingue per i materiali impiegati, le velocità raggiungibili e la resistenza alle interferenze elettromagnetiche.

---
##### Doppino intrecciato 

Il doppino intrecciato (Twisted Pair, TP) è il supporto guidato più diffuso e storicamente più utilizzato nelle reti locali. È composto da due fili di rame isolati e avvolti a spirale l'uno attorno all'altro: la struttura intrecciata serve a ridurre le interferenze elettromagnetiche reciproche tra i due fili e quelle provenienti dall'esterno. Nonostante il costo contenuto e la facilità di installazione, il doppino rimane suscettibile alle interferenze elettromagnetiche, soprattutto su distanze elevate o in ambienti con molte sorgenti di disturbo.

---
##### Cavo coassiale

Il cavo coassiale è caratterizzato da una struttura concentrica: un conduttore centrale in rame è circondato da uno strato isolante, a sua volta avvolto da un secondo conduttore metallico tubolare (la calza) e da una guaina esterna protettiva. Questa geometria conferisce al cavo una **elevata resistenza alle interferenze elettromagnetiche**, nettamente superiore rispetto al doppino intrecciato. 

---
##### Cavo in fibra ottica

La fibra ottica rappresenta la tecnologia di trasmissione guidata più performante attualmente disponibile. Anziché segnali elettrici, utilizza impulsi luminosi che si propagano all'interno di un sottilissimo filo di vetro purissimo: ogni impulso rappresenta un bit, e la trasmissione avviene a velocità elevatissime, nell'ordine delle decine o centinaia di Gbps per singolo collegamento punto-punto. I vantaggi della fibra ottica rispetto ai supporti in rame sono molteplici. In primo luogo, il segnale luminoso è completamente immune alle interferenze elettromagnetiche, eliminando una delle principali cause di degrado del segnale. In secondo luogo, l'attenuazione del segnale è molto inferiore rispetto al rame, il che consente di spaziare i ripetitori a distanze molto maggiori, riducendo i costi infrastrutturali sui lunghi tragitti. Infine, il tasso di errore è estremamente basso, il che garantisce trasmissioni affidabili anche su grandi distanze.

---
#### Supporti non guidati 

Nei supporti non guidati (wireless), il segnale si propaga liberamente nello spazio (modalità broadcast) attraverso onde elettromagnetiche, senza la necessità di un mezzo fisico che ne delimiti il percorso. Questa caratteristica rende il wireless estremamente flessibile e adatto alla mobilità, ma introduce anche alcune criticità legate all'ambiente di propagazione. La comunicazione è tipicamente half-duplex, nel senso che trasmettitore e ricevitore non possono trasmettere contemporaneamente sulla stessa frequenza. Possono essere:

---
##### Microonde terrestri

I collegamenti a microonde terrestri sono realizzati tramite antenne direzionali puntate l'una verso l'altra, e consentono trasmissioni punto-punto fino a 45 Mbps su distanze variabili, tipicamente dell'ordine di qualche decina di chilometri in linea di vista. Sono impiegati soprattutto per collegare sedi distanti in assenza di infrastrutture in fibra.

---
##### Reti locali senza fili (Wi-Fi)

Il Wi-Fi è la tecnologia wireless più diffusa per le reti locali (WLAN). Opera su frequenze standardizzate (2,4 GHz e 5 GHz) e consente velocità fino a 100 Mbps e oltre, a seconda dello standard impiegato. La copertura è tipicamente limitata a decine di metri, rendendolo adatto ad ambienti indoor come abitazioni, uffici e spazi pubblici.

---
##### Satellitare

I collegamenti satellitari consentono di raggiungere aree geografiche altrimenti inaccessibili tramite infrastrutture terrestri. Le velocità raggiungibili sono paragonabili a quelle delle microonde (fino a 45 Mbps), ma il limite principale è la latenza: i satelliti geostazionari si trovano a circa 36.000 km di quota, il che comporta un ritardo di propagazione end-to-end dell'ordine di 270 ms, non trascurabile per le applicazioni in tempo reale. I sistemi satellitari in orbita bassa (LEO), come Starlink, riducono sensibilmente questa latenza.

---
### TIPOLOGIE DI  RETE

Le reti possono essere classificate in base alla loro estensione geografica, seguendo una gerarchia che va dallo spazio personale fino all'intera superficie del pianeta. Di seguito sono analizzate nel dettaglio le principali tipologie:

---
#### Personal Area Network

La **Personal Area Network (PAN)** rappresenta il livello più intimo della connettività, limitandosi solitamente allo spazio vitale di un singolo individuo. Con un raggio d'azione che raramente supera i 10 metri, queste reti servono a mettere in comunicazione dispositivi personali come smartphone, cuffie wireless e smartwatch. L'esempio più comune di tecnologia PAN è il **Bluetooth**, che permette uno scambio dati rapido e a basso consumo energetico tra periferiche vicine.

---
#### Local Area Network

La **Local Area Network (LAN)** è l'ossatura digitale di case, uffici e piccoli edifici. Una LAN è tipicamente una rete privata dove ogni dispositivo (terminale) possiede un indirizzo univoco per essere identificato. Esistono due configurazioni principali:

- **LAN con cavo condiviso:** i dispositivi comunicano attraverso un cavo comune verso il router.
- **LAN con switch:** un'architettura più moderna e performante in cui i dispositivi sono collegati a uno o più switch, i quali gestiscono il traffico in modo intelligente dirigendo i pacchetti di dati solo al destinatario corretto, riducendo le collisioni e migliorando l'efficienza.

---
#### Metropolitan Area Network

Quando la rete deve coprire un'intera area urbana, si parla di **Metropolitan Area Network (MAN)**. Queste reti sono progettate per interconnettere diverse LAN situate all'interno di una città (ad esempio, le varie sedi di un'università o gli uffici comunali) offrendo velocità elevate su distanze di diversi chilometri.

---
#### Wide Area Network

Su scala ancora più ampia operano le **Wide Area Network (WAN)**, che collegano città, regioni o intere nazioni. Gestite solitamente dai grandi **Internet Service Provider (ISP)**, le WAN si dividono in due sottocategorie strutturali:

- **WAN point-to-point:** una connessione diretta tra due nodi o reti specifiche tramite un unico mezzo di trasmissione dedicato.
- **WAN a commutazione:** un sistema complesso dove i dati viaggiano attraverso molteplici nodi, mezzi di trasmissione e dispositivi di instradamento per raggiungere la destinazione, garantendo flessibilità e resilienza.

---
#### Internet

Al livello più alto troviamo **[[Internet Architecture|Internet]]**, definita spesso come la "rete delle reti". Non si tratta di un'unica infrastruttura centralizzata, ma di un'immensa ragnatela globale che interconnette tra loro milioni di PAN, LAN, MAN e WAN sparse in tutto il mondo. Grazie a protocolli di comunicazione standardizzati, Internet permette a sistemi eterogenei di dialogare tra loro, rendendo possibile lo scambio di informazioni su scala planetaria in tempo reale.

---
