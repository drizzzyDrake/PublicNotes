Nella policy **first-fit**, prima dell’allocazione di un processo viene effettuata una **scansione lineare della memoria** (o della lista dei buchi liberi) fino a individuare il **primo hole sufficientemente grande** da poter contenere il processo. Il processo viene quindi allocato in tale buco, mentre l’eventuale spazio residuo rimane come nuovo hole.

---

**Esempio:**

Si considerino tre holes di memoria di **20, 400 e 120 byte**.

- Se il processo **X** richiede **100 byte**, con la policy first-fit esso viene allocato nel **primo buco adeguato**, cioè quello da **400 byte**, generando un nuovo buco residuo di **300 byte**.
- Se successivamente il processo **Y** richiede **350 byte**, il sistema operativo **non può soddisfare la richiesta**, poiché nessuno dei buchi disponibili ha dimensione sufficiente.

![[first-fit.png]]

Questa policy è semplice e veloce, ma può portare a **frammentazione esterna**, rendendo impossibile l’allocazione di processi di grandi dimensioni anche in presenza di memoria complessivamente libera.

---