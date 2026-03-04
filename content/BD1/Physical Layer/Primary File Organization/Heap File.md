Un **heap file** è un file fisico in cui i record sono memorizzati **senza alcun ordinamento** rispetto ai valori degli attributi. Non esiste alcuna relazione tra **chiave di ricerca** e **posizione fisica** del record.

---
### STRUTTURA

Il file è composto da **blocchi (pagine)** di dimensione fissa. Ogni blocco contiene:

- un **header** (metadati, numero record, bitmap o slot directory)
- una collezione di **record**

I blocchi:

- **non hanno ordine logico** e i record vengono collocati in base alla **disponibilità di spazio**
- sono referenziati tramite una **directory del file**, che contiene i **puntatori ai blocchi**

> N.B. Se la directory è abbastanza piccola, può essere mantenuta in **memoria principale**. In tal caso il costo delle operazioni dipende solo dal numero di blocchi dati.

---
### FUNZIONAMENTO

#### Inserimento

Il DBMS individua l'ultimo blocco del file. Se in tale blocco c’è spazio sufficiente per memorizzare il nuovo record, il record viene inserito, altrimenti viene chiesto un nuovo blocco al file system, che viene allocato infondo al file. Dopo l’inserimento del record nel blocco, il blocco deve essere scritto su memoria secondaria:

**Costo medio:**

- **2 accessi** (1 lettura + 1 scrittura dell’ultimo blocco)
- quasi sempre **SBA**

> N.B. Nei sistemi reali la maggior parte dei DBMS **mantiene una lista o bitmap dei blocchi con spazio libero** (free list o space map). In questo modo il DBMS **sa subito** dove inserire il record: non serve scansionare tutto il file in quanto si accede direttamente al blocco disponibile. Se tutti i blocchi esistenti sono pieni, si alloca un blocco nuovo in coda. Dunque il costo medio reale è di **1 accesso**, che può essere **SBA** se contiguo o **RBA** se distante. 

---
#### Ricerca

Poiché non esiste alcuna relazione tra chiave e posizione fisica, l’unico metodo è la ricerca sequenziale:

> N.B. Una chiave di ricerca è **unica** se identifica al più un record nel file; è **non unica** se più record possono avere lo stesso valore. Negli heap file questa distinzione influisce direttamente sul costo delle operazioni, poiché solo nel caso di chiave unica è possibile applicare lo stop condizionato durante la ricerca.

---

**Linear search:**

- i blocchi vengono letti uno dopo l’altro
- in ogni blocco si confrontano i record con la chiave di ricerca

**Costo medio:**

In un file con **NBK** blocchi:

- chiave unica: **⌈NBK / 2⌉ accessi** (stop condizionato)
- chiave non unica: **NBK accessi** (full scan del file)

Gli accessi sono prevalentemente **SBA** e il costo cresce linearmente con la dimensione del file.

> N.B. Stop condizionato: una volta trovato il record con la chiave desiderata, allora, sapendo che **esiste al più un solo record** con quella chiave nel file, la ricerca può terminare.

---
#### Eliminazione

La cancellazione di tutti i record con un dato valore per la chiave richiede:

In un file con **NBK** blocchi:

- **chiave unica:** **⌈NBK / 2⌉ accessi** (stop condizionato) + **1 accesso** in **scrittura**
- **chiave non unica:** **NBK accessi** in **lettura** (full scan del file) + **NBKC accessi** in **scrittura**, dove **NBKC** è il numero di blocchi che contengono record da cancellare

Ulteriori accessi possono essere necessari per il **recupero dello spazio** precedentemente occupato dai record cancellati (attualmente vuoto) trasferendovi record che si trovano nell’ultimo blocco. Gli accessi sono prevalentemente **SBA** e il costo cresce linearmente con la dimensione del file.

---
#### Modifica 

La modifica, come l'eliminazione, richiede prima la **ricerca** del record e poi la **scrittura**:

In un file con **NBK** blocchi:

- **chiave unica:** **⌈NBK / 2⌉ accessi** (stop condizionato) + **1 accesso** in **scrittura**
- **chiave non unica:** **NBK accessi** in **lettura** (full scan del file) + **NBKC accessi** in **scrittura**, dove **NBKC** è il numero di blocchi che contengono record da modificare

Gli accessi sono prevalentemente **SBA** e il costo cresce linearmente con la dimensione del file.

---
### ESEMPIO
![[primary file organization.png]]
**Heap file:**

- **Capacità blocco (NRpBK)** = **2** record per blocco

```powershell
HEAP FILE
|
├─ Blocco 1 [Header: num_records=2]
|  ├─ Record: 101, Giulio, Informatica
|  └─ Record: 208, Riccardo, Lamentologia
|
├─ Blocco 2 [Header: num_records=2]
|  ├─ Record: 104, Andrea, Informatica
|  └─ Record: 416, Simone, Psicologia
|
└─ Blocco 3 [Header: num_records=1]
   └─ Record: 325, Serena, Pianto
```

---