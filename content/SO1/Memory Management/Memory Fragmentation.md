La **frammentazione della memoria** è la condizione in cui la memoria libera è suddivisa in **singoli [[Memory Allocation#HOLES|holes]]** che, presi singolarmente, sono **troppo piccoli per essere utilizzati da un processo**, ma che complessivamente sarebbero sufficienti se fossero contigui. Si distinguono due principali tipi di frammentazione:

---
### FRAMMENTAZIONE INTERNA

La frammentazione interna si verifica quando **una parte della memoria allocata a un processo rimane inutilizzata**, poiché il processo richiede meno spazio di quello effettivamente assegnato.  
È tipica dei sistemi con **[[Memory Allocation#ALLOCAZIONE STATICA|allocazione statica]] della memoria**, basata su **partizioni di dimensione fissa**, in cui lo spazio eccedente non può essere riutilizzato da altri processi.

---
#### Risoluzione della frammentazione interna

La **frammentazione interna** è **intrinsecamente irrisolvibile**, poiché lo spazio sprecato si trova all’interno delle partizioni assegnate. Può tuttavia essere **parzialmente mitigata** creando **partizioni di dimensione crescente**, consentendo ai processi più piccoli di occupare partizioni ridotte e limitando lo spreco di memoria.

---
### FRAMMENTAZIONE ESTERNA

La frammentazione esterna si verifica quando esiste **abbastanza memoria libera totale** per soddisfare una richiesta, ma tale memoria è **suddivisa in holes non contigui**, rendendo impossibile l’allocazione. È tipica dei sistemi che utilizzano **[[Memory Allocation#ALLOCAZIONE DINAMICA|allocazione dinamica]] contigua**, e nasce a seguito del **frequente allocazione e de-allocazione dei processi**, che spezzano la memoria in numerosi buchi di dimensioni variabili.

---
#### Risoluzione della frammentazione esterna

La **frammentazione esterna** può essere risolta tramite **compattazione**, che consiste nel rilocare i processi in memoria:

---

**Compattazione totale**: 

Tutti i processi vengono spostati in memoria in modo contiguo, unendo tutti gli holes sparsi in un **unico grande hole**. Nel nostro esempio, i tre holes da 20, 20 e 50 byte diventano un hole unico da 90 byte, permettendo di allocare il processo **Z** da 70 byte, con 20 byte residui.

![[full compaction.png]]

---

**Compattazione parziale**: 

Vengono spostati solo i processi necessari per creare un hole abbastanza grande per il nuovo processo. Ad esempio, si possono unire gli hole da 20 e 50 byte in un hole da 70 byte, sufficiente per il processo **Z** (sa 70 byte), lasciando l'hole da 20 byte intatto.

![[partial compaction.png]]

---

