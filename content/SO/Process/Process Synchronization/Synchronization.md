Quando più processi o thread **cooperano** su un’attività comune, possono accedere a **risorse condivise** (variabili, file, memoria, ecc.). Il problema nasce se due o più thread accedono **simultaneamente** a queste risorse: i dati potrebbero diventare **inconsistenti**. Un **settore critico** è quindi una porzione di codice che **accende o modifica risorse condivise**. Per accedere in sicurezza a un settore critico, serve la **sincronizzazione**, ossia un meccanismo che garantisca che solo un thread per volta possa eseguire quel codice.
![[synchronization.png]]

---
### PROPRIETA' 

Ogni soluzione per il settore critico deve rispettare tre proprietà:

- **Mutua esclusione (mutual exclusion)**: solo un thread per volta può entrare nel settore critico.
- **Vitalità (liveness)**: ogni thread che vuole entrare nel settore critico deve **avere la possibilità di farlo** se nessun altro thread vi è già.
- **Attesa limitata (bounded waiting)**: ogni thread richiedente deve poter accedere al settore critico **entro un numero finito di turni**, evitando starvation.

---
### PRIMITIVE DI SINCRONIZZAZIONE

I linguaggi e i sistemi operativi forniscono **primitive atomiche** per gestire l’accesso ai settori critici. Le principali sono:

- **[[Lock]]**
- **[[Semaphore]]**
- **[[Monitor]]**

---

