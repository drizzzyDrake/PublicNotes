Gli algoritmi basati sul **priority scheduling** sono algoritmi di scheduling della CPU in cui **a ogni processo viene assegnato un valore di priorità**, utilizzato dallo scheduler per determinare **l’ordine di esecuzione**. In generale, **il processo con priorità più alta viene schedulato per primo**.

Le priorità possono essere assegnate in due modi:

- **Internamente**, ossia dal sistema operativo, sulla base di criteri quali: durata media dei CPU burst, rapporto tra attività di CPU e I/O, risorse utilizzate, comportamento storico del processo.
- **Esternamente**, ossia dall’utente o da un amministratore, in base all’importanza del processo o a politiche applicative.

Il **priority scheduling** può essere implementato sia in forma:

- **non-preemptive**, dove un processo, una volta ottenuta la CPU, la mantiene fino a quando termina o si blocca volontariamente,
- **preemptive**, dove un processo in esecuzione può essere interrotto se arriva nella ready queue un altro processo con priorità più alta.

Il principale problema del priority scheduling è la **starvation** (o bloccaggio infinito): un processo a **bassa priorità** può rimanere **indefinitamente in attesa** se continuano ad arrivare processi con priorità maggiore, senza mai ottenere l’accesso alla CPU. Una tecnica comune per prevenire la starvation è l’**aging**, che consiste nell’**incrementare gradualmente la priorità di un processo in base al tempo trascorso in attesa** nella ready queue, fino a garantirne l’esecuzione.

---
