Il **Data Delivery** è il processo complessivo mediante il quale l'informazione (sotto forma di pacchetti o frame) viene trasferita attraverso un'infrastruttura di rete dal sistema sorgente al sistema destinazione. 

![[forwarding and routing.png]]

---
### COMMUTAZIONE DI PACCHETTO

Nella commutazione di pacchetto, i dati da trasmettere vengono suddivisi in unità discrete chiamate **pacchetti** (packets). Ciascun pacchetto viene inoltrato in modo indipendente da un router all'altro lungo il percorso che va dall'origine alla destinazione, seguendo i collegamenti disponibili nella rete.

---
#### Store-and-forward

Il principio fondamentale su cui si basa questa modalità è il **store-and-forward**: ogni router deve ricevere e memorizzare l'intero pacchetto prima di poterlo ritrasmettere sul collegamento successivo. Il pacchetto non può essere inoltrato "al volo" durante la ricezione, ma deve attendere di essere completamente acquisito dal nodo intermedio. Questo meccanismo introduce una latenza di elaborazione ad ogni salto, ma garantisce che il nodo possa verificare l'integrità del pacchetto prima di trasmetterlo.

![[store and forward.png]]

---
#### Code e perdita di pacchetti

Un aspetto critico della commutazione di pacchetto riguarda la gestione delle situazioni di congestione. Se la velocità di ricezione dei pacchetti su un'interfaccia di ingresso supera la velocità di trasmissione disponibile sull'interfaccia di uscita, i pacchetti in eccesso vengono temporaneamente accodati in un buffer, in attesa di essere trasmessi. Tuttavia, la capacità del buffer è finita. Se il buffer raggiunge la sua capienza massima, i pacchetti in arrivo non possono essere memorizzati e vengono **scartati** (packet loss). I pacchetti persi possono, se necessario, essere ritrasmessi dal mittente originale, tipicamente grazie a meccanismi di controllo degli errori a livello di trasporto, come quelli del protocollo TCP. 

![[packet loss.png]]

---
#### Throughput $\large T$

Il throughput, che indichiamo con $\large T$, misura la quantità effettiva di dati (in b/s) che transitano attraverso un nodo o un percorso della rete in un dato intervallo di tempo. A differenza del transmission rate, che è una caratteristica del link, il throughput dipende dalle condizioni reali della rete: carico, congestione, interferenze. Per un trasferimento di $\large F$ bit completato in $\large t$ secondi, il throughput medio è $\large T = \frac{F}{t}$

> N.B. A differenza del transmission rate, il quale fornisce una misura della potenziale velocità di un link, il throughput fornisce una misura dell’effettiva velocità di un link. In generale, dunque, si ha che $\large T < R$.

---
##### Bottleneck

In un percorso end-to-end composto da più link in serie, il throughput complessivo non è determinato dal link più veloce, bensì da quello più lento, detto **collo di bottiglia**. 

![[bottleneck.png]]
 
> Il link 2 risulta essere il collo di bottiglia di tale percorso, limitando il throughput del percorso a 100 kb/s

---
#### Traffic Intensity $\large I$

L'intensità di traffico è un numero puro (adimensionale) che misura il **grado di impegno di un link** o di una risorsa di rete. Serve a prevedere l'entità del delay di queueing $\large D_q$. Siano $\large L$ la **dimensione media di un pacchetto** (in bit), $\large a$ **la frequenza media di arrivo dei pacchetti** (pacchetti/secondo) e $\large R$ il **transmission rate** (bps), l'intensità di traffico è definita come: $\large I = \frac{L \times a}{R} = D_t \times a$. 

- $\large I \to 0$ : il traffico è scarso, il ritardo di coda è quasi nullo.
- $\large I \to 1$ : il traffico si avvicina alla capacità massima del link. Il ritardo di coda cresce in modo esponenziale (tende all'infinito).
- $\large I \gt 1$ : il sistema è instabile. Arrivano più bit di quanti il link possa trasmetterne. Le code esplodono e si verificano perdite di pacchetti (packet loss).

---
#### Delay di un pacchetto $\large D$

Il tempo totale necessario a un pacchetto per attraversare un nodo o un intero percorso di rete è detto latenza (o delay). Il delay totale subito da un pacchetto in corrispondenza di un singolo nodo è la somma delle quattro componenti: $\large D = D_e + D_q + D_t + D_p$

![[dalay.png]]

---

**Delay end-to-end**

Su un percorso con $\large N$ link (e quindi $\large N-1$ router intermedi), nell'ipotesi di rete non congestionata ($\large D_q \approx 0$) e parametri omogenei su tutti i nodi, il delay totale end-to-end è:

$\large D_{e2e} = N \cdot (D_e + D_t + D_p) = N \cdot \left(D_e + \frac{L}{R} + \frac{k}{v}\right)$

In presenza di accodamento e parametri eterogenei tra i nodi, il delay end-to-end si ottiene invece sommando le quattro componenti per ciascun nodo attraversato:

$\large D_{e2e} = \sum_{i=1}^{N} \left(D_{e_i} + D_{q_i} + D_{t_i} + D_{p_i}\right)$

---
##### Delay di elaborazione $\large D_e$

È il tempo impiegato dal nodo per esaminare l'intestazione del pacchetto, verificarne l'integrità e determinare l'interfaccia di uscita corretta. Dipende dalla velocità di calcolo del router e dalla complessità delle operazioni svolte. Tipicamente dell'ordine dei microsecondi nei router moderni.

---
##### Delay di queueing $\large D_q$

È il tempo che il pacchetto trascorre in attesa nella coda di uscita del nodo, prima di poter essere trasmesso sul link. Dipende dal carico istantaneo della rete: se la coda è vuota il delay è nullo, se è congestionata può diventare la componente dominante. È la componente più variabile e imprevedibile.

---
##### Delay di trasmissione $\large D_t$

È il tempo necessario al nodo per **immettere fisicamente tutti i bit del pacchetto sul link**. Dipende dalla **dimensione del pacchetto** $\large L$ (in bit) e dal **transmission rate** $\large R$ del link: $\large D_t = \frac{L}{R}$

---
##### Delay di propagazione $\large D_p$

È il tempo impiegato dall'**ultimo bit trasmesso** per propagarsi fisicamente da un nodo all'altro. Dipende dalla **lunghezza del link** $\large k$ e dalla **velocità di propagazione del segnale $\large v$** nel mezzo (che dipende dal tipo di mezzo): $\large D_p = \frac{k}{v}$ ($\large D_p = \frac{\text{RTT}}{2}$)

---
#### Bandwidth-Delay Product $\large B_{max}$

Il prodotto tra il **transmission rate $R$** di un link e il suo **delay di propagazione** $\large D_p$ fornisce una quantità importante: il **massimo numero di bit che possono trovarsi contemporaneamente "in transito" sul link** in un dato istante. $\large B_{max} = R \times D_p$

> Questa grandezza rappresenta la **capacità volumetrica** del link: quanti bit possono essere distribuiti lungo il cavo nello stesso momento. È utile per dimensionare i buffer e per ragionare sull'efficienza dei protocolli di controllo del flusso.

---
### COMMUTAZIONE DI CIRCUITO

Nella commutazione di circuito, prima che la comunicazione tra due nodi abbia inizio, viene stabilito un circuito dedicato, ovvero viene riservata in anticipo una porzione delle risorse della rete (banda, slot temporali) per tutta la durata della sessione. Questo approccio è tipico delle reti telefoniche tradizionali.

---

**Affidabilità e inefficienza:**

Il vantaggio principale è la garanzia di qualità del servizio: poiché le risorse sono riservate, non si verificano code né perdite di dati durante la trasmissione. Lo svantaggio è la scarsa efficienza nell'uso delle risorse: se i due interlocutori non stanno trasmettendo in un dato momento, le risorse riservate rimangono inutilizzate. Inoltre, il numero massimo di comunicazioni simultanee supportate dalla rete è strettamente limitato dal numero di circuiti che è possibile riservare. 

---
#### Frequency Division Multiplexing (FDM)

Nel **Frequency Division Multiplexing (FDM)**, la banda complessiva del mezzo trasmissivo viene suddivisa in bande di frequenza distinte. A ciascuna comunicazione attiva viene assegnata una banda di frequenza esclusiva, all'interno della quale può trasmettere in modo continuo. Le diverse comunicazioni coesistono sullo stesso mezzo fisico senza interferirsi, poiché occupano porzioni diverse dello spettro di frequenza. La velocità massima di ciascuna comunicazione è limitata dalla larghezza della banda assegnatale.

![[fdm.png]]

---
#### Time Division Multiplexing (TDM)

Nel **Time Division Multiplexing (TDM)**, la risorsa condivisa non è la frequenza ma il tempo. Il tempo viene suddiviso in slot periodici di breve durata, e a ciascuna comunicazione viene assegnato uno slot specifico all'interno di ogni ciclo. Durante il proprio slot, una comunicazione può utilizzare l'intera banda del mezzo trasmissivo, ma solo per quel breve intervallo di tempo. Al di fuori del proprio slot, la comunicazione non trasmette, e il mezzo è occupato dalle altre comunicazioni.

![[tdm.png]]

---

