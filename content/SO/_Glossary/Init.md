**init**, in Unix/Linux è **il primo processo utente** creato dal kernel all’avvio del sistema e rappresenta il **punto di origine di tutti gli altri processi**.

- viene creato **direttamente dal kernel** durante il boot;
- ha **PID = 1**;
- non ha un processo padre;
- rimane attivo finché il sistema è acceso.

> `init` è il **capostipite** dell’albero dei processi.

---
### FUNZIONE

`init` ha il compito di:

- avviare i **servizi di sistema** (daemon);
- avviare l’ambiente utente (login, shell, GUI);
- gestire i **processi orfani**;
- mantenere il sistema in uno stato operativo coerente.

Senza `init`, il sistema non può funzionare in modo stabile.

---