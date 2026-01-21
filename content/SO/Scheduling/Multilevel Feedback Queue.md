L’algoritmo **Multilevel Feedback Queue (MLFQ)** estende l’algoritmo **Multilevel Queue (MLQ)** introducendo la **possibilità di spostare dinamicamente i processi tra le diverse code** di priorità, in base al loro comportamento nel tempo.

Lo spostamento di un processo tra le code è utile quando:

- un processo cambia il proprio comportamento, passando da **CPU-bound** a **I/O-bound** (o viceversa);
- un processo rischia la **starvation**, venendo temporaneamente promosso in una coda a priorità più alta per garantirne l’esecuzione.

Per gestire dinamicamente le priorità, l’MLFQ segue alcune regole generali:

- **Tutti i processi vengono inizialmente inseriti nella coda a priorità più alta**.
- Se il **time slice di un processo scade**, il processo viene **declassato** e spostato in una coda con **priorità inferiore**.
- Se un processo **rilascia la CPU prima dello scadere del time slice** (ad esempio perché richiede I/O), viene **promosso** o mantiene una **priorità più alta**.
- I processi **CPU-bound** vengono rapidamente penalizzati, scendendo verso code a priorità più bassa.
- I processi **I/O-bound** tendono a mantenere una **priorità elevata**, risultando più reattivi.

Grazie a questo meccanismo di **feedback**, l’MLFQ riesce ad adattarsi automaticamente al comportamento dei processi, bilanciando **reattività**, **throughput** ed **equità**, riducendo il rischio di starvation senza richiedere informazioni a priori sui CPU burst.

---