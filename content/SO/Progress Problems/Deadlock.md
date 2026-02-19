Un **deadlock** è una situazione in cui **due o più processi/thread restano bloccati permanentemente**, perché **ognuno attende una risorsa detenuta da un altro**, formando una **attesa circolare** che impedisce qualsiasi progresso dell’esecuzione.

In un deadlock:

- nessun processo può continuare
- nessun processo può rilasciare le risorse che detiene
- l’intervento esterno è necessario per risolvere la situazione.

---
### CONDIZIONI DI COFFMAN

Un deadlock può verificarsi **se e solo se** sono soddisfatte contemporaneamente tutte le seguenti condizioni:

- **Mutua esclusione:** almeno un processo è in possesso di una risorsa non condivisibile (in particolare, solo un thread può essere in possesso della risorsa).
- **Hold and wait:** un processo detiene una o più risorse mentre ne richiede altre.
- **No preemption:** un processo può rilasciare una risorsa solo per scelta volontaria, dunque né un altro processo né un altro thread possono forzare il rilascio.
- **Attesa circolare:** esiste una catena circolare di processi in cui ciascuno attende una risorsa detenuta dal successivo.

---
### RILEVARE UN DEADLOCK

Per rilevare la presenza di un deadlock in un sistema è possibile schematizzare la catena di richieste e assegnamenti delle risorse tramite un **Resource Allocation Graph (RAG)**. Un **RAG** è un grafo diretto **G = (V, E)** dove:

- **V** è l’insieme dei **vertici** rappresentanti sia le risorse <b>(r<sub>1</sub>, ..., r<sub>k</sub>)</b> sia i thread <b>(t<sub>1</sub>, ..., t<sub>k</sub>)</b> considerati.
- E è l’insieme degli **archi del grafo**, i quali possono essere di due tipi: **archi di richiesta** (frecce rosse), che indicano che il thread <b>t<sub>i</sub></b> ha richiesto la risorsa <b>r<sub>j</sub></b>, e **archi di assegnamento** (frecce viola), che indicano che l’OS ha allocato la risorsa <b>r<sub>j</sub></b> al thread <b>t<sub>i</sub></b>.

**Esempio:**

Consideriamo il seguente RAG:
![[rag.png]]
In tal caso, è facilmente individuabile la presenza di un deadlock: 

1. Il thread <b>t<sub>2</sub></b>, possedente la risorsa <b>r<sub>3</sub></b>, richiede la risorsa <b>r<sub>1</sub></b>, rimanendo in attesa che essa sia liberata dal thread <b>t<sub>3</sub></b>.
2. A questo punto, il thread <b>t<sub>3</sub></b>, possedente la risorsa <b>r<sub>1</sub></b>, richiede la risorsa <b>r<sub>2</sub></b>, rimanendo in attesa che essa sia liberata dal thread <b>t<sub>4</sub></b>.
3. A sua volta, il thread <b>t<sub>4</sub></b>, possedente la risorsa <b>r<sub>2</sub></b>, richiede la risorsa <b>r<sub>3</sub></b>, rimanendo in attesa che essa sia liberata dal thread <b>t<sub>2</sub></b>.
4. In definitiva, si è in una situazione dove <b>t<sub>2</sub></b> aspetta <b>t<sub>3</sub></b>, il quale sta aspettando <b>t<sub>4</sub></b>, il quale a sua volta sta aspettando <b>t<sub>2</sub></b>, creando quindi un deadlock.

> N.B. Se, ad esempio, il thread <b>t<sub>4</sub></b> non richiedesse la risorsa <b>r<sub>3</sub></b>, le condizioni necessarie affinché possa verificarsi un deadlock non sarebbero soddisfatte, per via dell’assenza dell’attesa circolare.

---
### PREVENIRE UN DEADLOCK

Per prevenire un deadlock è sufficiente che una sola delle quattro condizioni di Coffman non si verifichi. Inoltre, è possibile studiare il comportamento di una sequenza di **n** thread per determinare se tale sequenza sia sicura oppure no: 

- Sia <b>m<sub>i</sub></b> il numero massimo di risorse che il thread **i** possa richiedere.
- Sia <b>c<sub>i</sub></b> il numero di risorse attualmente occupate dal thread **i**.
- Sia <b>C=Σ<sub>i=1</sub><sup>n</sup> c<sub>i</sub></b> il numero totale di risorse attualmente allocate nel sistema.
- Sia **R** il numero massimo di risorse disponibili.

Definiamo una sequenza di thread come **sicura** se **per ogni thread** si verifica che:

$$m_i-c_i\le R-C+\sum_{j=1}^{i-1}c_j$$
All'interno della formula possiamo distinguere:

- <b>m<sub>i</sub></b> **−** <b>c<sub>i</sub></b> è il numero di risorse ancora richiedibili dal thread **i**.
- **R − C** è il numero di risorse attualmente disponibili 
- <b>Σ<sub>j=1</sub><sup>i-1</sup> c<sub>j</sub></b> è il numero di risorse attualmente allocate fino al thread **i** , dove **j < i**.

---
### STATO SICURO

Si definisce **stato sicuro** una configurazione del sistema in cui esiste almeno una **sequenza sicura di esecuzione dei thread**, tale che ciascun thread possa ottenere le risorse necessarie e completare la propria esecuzione senza causare deadlock. Uno **stato insicuro** non implica necessariamente la presenza di un deadlock, ma la possibilità che il deadlock possa facilmente verificarsi. Secondo questa policy, una risorsa viene concessa a un thread **solo se l’allocazione mantiene il sistema in uno stato sicuro**; in caso contrario, il thread viene posto in attesa. In questo modo si evita la formazione di **attese circolari**, prevenendo la possibilità di deadlock.

---

**Archi di pretesa:**

Oltre alla formula numerica precedentemente vista, per determinare uno stato sicuro, viene utilizzata una variante del **RAG** avente una tipologia aggiuntiva di arco, ossia gli archi di pretesa, indicanti che il thread <b>t<sub>i</sub></b> potrebbe richiedere la risorsa <b>r<sub>j</sub></b> in futuro. In questa tipologia di **RAG**, **soddisfare** una pretesa equivale a **trasformare un arco di pretesa in un arco di assegnamento**, mentre **la presenza di cicli indica un possibile stato insicuro**. Se un assegnamento generasse uno stato insicuro, allora **tale assegnamento non verrà effettuato anche nel caso in cui la risorsa sia effettivamente disponibile**.

**Esempio:**

Consideriamo il seguente RAG:
![[rag 1.png]]
Supponiamo che venga soddisfatta la pretesa del thread <b>t<sub>4</sub></b>. In tal caso, si andrebbe a creare uno **stato insicuro** poiché, nel caso in cui anche il thread <b>t<sub>3</sub></b> vada a richiedere la risorsa <b>r<sub>2</sub></b> (quindi trasformando l’arco di pretesa in un arco di richiesta) si andrebbe a creare un deadlock. Dunque tale pretesa non verrebbe soddisfatta.

---

**Algoritmo del banchiere:**

L'algoritmo del banchiere è una strategia di **evitamento del deadlock** (stallo) utilizzata dai sistemi operativi per gestire l'allocazione delle risorse. Il nome deriva dall'analogia con una banca: il banchiere non presta mai denaro se non è certo di poter soddisfare le richieste future di tutti i suoi clienti, evitando di restare senza liquidità. 

L'algoritmo decide se concedere o meno una risorsa a un processo simulando l'allocazione e verificando se il sistema rimane in uno **stato sicuro**. Ogni processo deve dichiarare in anticipo il **numero massimo** di risorse di cui potrebbe aver bisogno durante la sua esecuzione. Quando un processo richiede risorse, il sistema controlla se la richiesta è inferiore o uguale alla necessità massima dichiarata e se le risorse sono effettivamente disponibili.

Infine il sistema simula l'assegnazione e cerca una **sequenza sicura** di esecuzione (un ordine in cui tutti i processi possono terminare uno dopo l'altro).

- Stato Sicuro: esiste almeno una sequenza che non presenta deadlock.
- Stato Non Sicuro: non esiste tale sequenza (la richiesta viene sospesa).

---