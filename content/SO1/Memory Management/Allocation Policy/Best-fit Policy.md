Nella policy **best-fit**, prima dell’allocazione di un processo viene effettuata una **scansione lineare di tutti gli holes presenti in memoria**. Tra questi, viene selezionato il **buco più piccolo che sia comunque sufficientemente grande** da poter contenere il processo, con l’obiettivo di preservare i buchi di dimensione maggiore per processi che richiedono più memoria.

---

**Esempio:**

Si considerino tre buchi di memoria di **20, 400 e 120 byte**.

- Se il processo **X** richiede **100 byte**, con la policy best-fit esso viene allocato nel **buco da 120 byte**, generando un buco residuo di **20 byte**.
- Se successivamente il processo **Y** richiede **350 byte**, il sistema operativo lo alloca nel **buco da 400 byte**, creando un nuovo buco residuo di **50 byte**.

Al termine delle allocazioni, la memoria libera totale è pari a **90 byte** (20 + 20 + 50). Tuttavia, essendo suddivisa in **buchi di dimensioni molto ridotte**, tale memoria risulta difficilmente utilizzabile da nuovi processi, causando **frammentazione esterna** e spreco di memoria.

![[best-fit.png]]
Questa policy tende a minimizzare lo spazio inutilizzato per singola allocazione, ma può peggiorare la frammentazione complessiva del sistema.

---