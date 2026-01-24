Un **lock** è una primitiva di sincronizzazione che garantisce la **mutua esclusione** nell’accesso a un **settore critico**, assicurando che **un solo thread/processo alla volta** possa accedere a dati condivisi.

> Terminologia: acquisire un lock significa ottenere in modo atomico l’accesso esclusivo a una risorsa condivisa, impedendo l’ingresso concorrente di altri thread nel settore critico.

---
### PRIMITIVE DEL LOCK

Un lock fornisce due primitive fondamentali:

- Il metodo **`Lock.acquire()`**: Il thread richiede il lock e **rimane in attesa** finché il lock non è libero, quando lo diventa, lo acquisisce.
- Il metodo **`Lock.release()`**: Il thread rilascia il lock precedentemente acquisito e **notifica** i thread in attesa.

---
### REGOLE DI UTILIZZO

Per usare correttamente un lock è necessario che:

- Il lock venga **acquisito prima** di accedere a dati condivisi
- Il lock venga **rilasciato dopo** aver terminato l’uso dei dati condivisi
- Il lock sia **inizialmente libero**
- **Un solo thread alla volta** possa acquisire il lock

La violazione di queste regole può causare **race condition o deadlock**.

---
### ATOMICITA' E SCHEDULING

Durante l’**acquisizione** o il **rilascio** di un lock:

- **non deve avvenire alcun context switch**,
- il thread **non deve essere interrotto**,    
- l’operazione deve essere eseguita **tutta o niente**.

Per questo motivo, tali operazioni devono essere **atomiche**.

---
### IMPLEMENTAZIONE HARDWARE

Per garantire la correttezza della mutua esclusione, le operazioni di **acquisizione e rilascio di un lock** devono essere **atomiche**, cioè non interrompibili. Questo richiede un **supporto hardware** che impedisca al sistema di effettuare un context switch durante tali operazioni. Le principali soluzioni adottate presentano però alcune criticità.

---
#### Disabilitazione degli interrupt

Una prima soluzione consiste nel **disabilitare gli interrupt** durante l’acquisizione e il rilascio del lock. In questo modo, il thread in esecuzione non può essere interrotto e l’operazione risulta atomica. Tuttavia, questa tecnica presenta **importanti limitazioni**:

- richiede l’intervento del kernel;
- è **inutilizzabile su sistemi multi-core**, poiché la disabilitazione degli interrupt riguarda solo il core corrente;
- è poco scalabile e non adatta a sistemi moderni.

Per questi motivi, tale approccio è considerato **obsoleto** e limitato a casi molto specifici.

---
#### Istruzioni atomiche e spinlock

La soluzione più diffusa si basa sull’uso di **istruzioni atomiche**, fornite dall’hardware, in grado di leggere e modificare una variabile condivisa in un’unica operazione indivisibile. Un esempio tipico è l’istruzione **`test&set`**. L’uso di `test&set` consente di implementare uno **spinlock**, ovvero un lock in cui:

- il thread tenta di acquisire il lock;
- se il lock è occupato, **rimane in attesa attiva** ripetendo il test fino a quando il lock si libera.

In particolare se il valore del lock è 0 (libero), `test&set` lo imposta a 1 e il thread acquisisce il lock. Se il valore è 1 (occupato), il thread continua ad attendere. Gli spinlock garantiscono atomicità e correttezza, ma introducono diverse problematiche:

- i thread in attesa **consumano CPU inutilmente** (busy waiting);
- quando il lock viene rilasciato, **tutti i thread in attesa si contendono il lock**;
- non è garantito quale thread riuscirà ad acquisirlo, causando **non determinismo** e possibile starvation.

Questi problemi rendono gli spinlock inefficienti in presenza di attese lunghe.

---
#### Miglioramenti: lock con coda

Per mitigare tali limiti, vengono introdotti **lock con coda**, nei quali i thread in attesa vengono inseriti in una **struttura ordinata**. In questo modo:

- l’attesa attiva viene ridotta o eliminata;
- l’ordine di acquisizione del lock diventa **deterministico**;
- la starvation viene limitata.

Sebbene il tempo di attesa non possa essere eliminato completamente, questi meccanismi permettono di **minimizzare lo spreco di risorse** e migliorare l’equità del sistema.

---
