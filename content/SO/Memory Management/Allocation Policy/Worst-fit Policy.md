Nella policy **worst-fit**, prima dell’allocazione di un processo viene effettuata una **scansione lineare di tutti gli holes presenti in memoria**. Tra questi, viene selezionato il **buco di dimensione maggiore** che sia sufficientemente grande da poter contenere il processo. L’idea è lasciare, dopo l’allocazione, un buco residuo ancora abbastanza grande da poter essere riutilizzato.

---

**Esempio:**

Si considerino tre buchi di memoria di **20, 400 e 120 byte**.

- Se il processo **X** richiede **100 byte**, con la policy worst-fit esso viene allocato nel **buco da 400 byte**, generando un buco residuo di **300 byte**.
- Se successivamente il processo **Y** richiede **350 byte**, il sistema operativo **non può soddisfare la richiesta**, poiché nessun buco disponibile è sufficientemente grande.

![[worst-fit.png]]

In modo controintuitivo, questa policy tende a ridurre la creazione di buchi molto piccoli, aumentando la probabilità che lo spazio residuo sia ancora utilizzabile da altri processi. Tuttavia, nella pratica, **worst-fit è spesso meno efficiente** rispetto a first-fit e best-fit e può portare a un uso non ottimale della memoria.

---