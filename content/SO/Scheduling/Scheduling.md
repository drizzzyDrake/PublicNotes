Lo **scheduling** è l’**insieme delle politiche e dei criteri** con cui lo [[Scheduler|scheduler]] decide **come e quando assegnare la CPU ai processi** pronti all’esecuzione. Rappresenta un concetto **astratto**, indipendente dall’implementazione concreta.

Gli obiettivi principali dello scheduling sono:

- garantire **equità** tra i processi,
- migliorare la **reattività** del sistema,
- massimizzare l’**utilizzo della CPU**,
- ridurre tempi di attesa e di completamento.

---
### PREEMPTIVE VS NON-PREEMPTIVE

Lo scheduling può essere:

- **preemptive (preventivo)**: lo scheduler **può interrompere un processo in esecuzione** e decidere se continuare a eseguirlo oppure selezionare un altro processo pronto.
- **non-preemptive (non-preventivo)**: lo scheduler **non può interrompere un processo in esecuzione**. Una volta avviato, il processo continua a essere eseguito **fino a quando termina oppure si blocca volontariamente** (ad esempio per una richiesta di I/O).

---
### TEMPISTICHE DI SCHEDULING

**Arrival time**: 

Istante in cui il processo arriva nella ready queue.

---

**Start time**: 

Istante in cui la CPU esegue la prima istruzione del processo.

---

**Completion time**: 

Istante in cui il processo termina. 

- Per algoritmi non-preemptive: Completion Time = Start Time + Burst Time.
- Per algoritmi preemptive: Completion Time ≠ Start Time + Burst Time, va calcolato seguendo la timeline completa (un processo può essere **interrotto più volte** a causa del **time slice**).

---

**Turnaround time**: 

Tempo totale dall'arrivo al completamento. 
Turnaround time = Completion time − Arrival time.

---

**Waiting time**: 

Tempo totale trascorso nella ready queue (tempo sottratto ai burst di CPU).
Waiting time = Turnaround time − Burst time. 

>N.B. Il tempo trascorso nello stato waiting **non** è considerato waiting time della CPU perché il processo non compete per la CPU mentre è in I/O).

---

**Response time**: 

Tempo totale dall’arrivo alla prima risposta (inizio esecuzione o primo output).
Response time = Start time − Arrival time.

---

**Burst time (CPU burst)**: 

Tempo totale di CPU richiesto dal processo (somma dei burst di CPU).
Burst time = Turnaround time − Waiting time

---
### ALGORITMI DI SCHEDULING

Esistono più algoritmi di scheduling, ognuno con caratteristiche e tempistiche differenti.

---
#### Criteri di valutazione

Durante la scelta dell’algoritmo di scheduling migliore è necessario considerare più criteri, in particolare si deve tendere a: 
 
 - La **massimizzazione dell’utilizzo della CPU**.
 - La **massimizzazione del throughput**.
 - La **minimizzazione del turnaround time**.
 - La **minimizzazione del waiting time**.
 - La **minimizzazione del response time**.

> N.B. Massimizzazione dell'utilizzo della CPU = percentuale di tempo in cui la CPU è occupata (idealmente si tende al 100%, su sistemi concreti è sufficiente che sia tra il 40% e il 90%).
> Throughput = numero di processi completati in un'unità di tempo.

---
#### Algoritmi

- [[First Come First Served]]
- [[Round Robin]]
- [[Shortest Job First]]
- [[Priority Scheduling]]
- [[Multilevel Queueing]]
- [[Multilevel Feedback Queue]]
- [[Lottery Scheduling]]

---