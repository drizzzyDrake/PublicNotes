L’algoritmo **Round Robin (RR)** è un algoritmo di **CPU scheduling preemptive** in cui i processi nella **ready queue** vengono eseguiti a turno secondo una politica **FIFO circolare**, utilizzando un **time slice** (o **time quantum**) come limite massimo di utilizzo della CPU per ogni processo.

- Ogni volta che un processo ottiene la CPU, il **time slice** viene resettato.
- Se il processo termina **prima** dello scadere del time slice, lo scheduler seleziona il prossimo processo in ready queue.
- Se il time slice **scade** prima che il processo termini, lo scheduler **interrompe** il processo corrente (preemption), lo sposta alla **fine della ready queue** e seleziona il processo successivo. Quando il suo turno **torna di nuovo**, lo scheduler gli assegna nuovamente la CPU, e il processo **riprende l’esecuzione esattamente da dove era stato interrotto**,

Grazie a questo meccanismo, la CPU viene distribuita **equamente tra tutti i processi**, garantendo buona **reattività** soprattutto nei sistemi interattivi.

---
### PARAMETRI

<b>CT<sub>i</sub> ≠ ST<sub>i</sub> + BT<sub>i</sub></b> in generale, perché il processo può essere **interrotto più volte** a causa del **time slice**. Per calcolare **CT** bisogna **seguire tutta la timeline**, sommare tutti i periodi di CPU che il processo ha effettivamente eseguito fino al completamento (algoritmo preemptive).

---
## ESEMPIO

Calcolare il tempo medio di attesa (WT) e di turnaround (TT) con l’algoritmo **Round Robin** del seguente sistema, con **time slice q = 2 ms**.

| Process | AT (ms) | CPU BT (ms) |
| ------- | ------- | ----------- |
| P1      | 0       | 7           |
| P2      | 2       | 4           |
| P3      | 4       | 1           |
| P4      | 5       | 4           |

**Evoluzione della ready queue con q = 2 (ms):**

```
0–2    P1 (ready queue = P1, P2)          remaining time P1 = 7 - 2 = 5
2–4    P2 (ready queue = P2, P1, P3)      remaining time P2 = 4 - 2 = 2
4–6    P1 (ready queue = P1, P3, P2, P4)  remaining time P1 = 5 - 2 = 3
6–7    P3 (ready queue = P3, P2, P4, P1)  remaining time P3 = 1 - 1 = 0
7–9    P2 (ready queue = P2, P4, P1)      remaining time P2 = 2 - 2 = 0
9–11   P4 (ready queue = P4, P1)          remaining time P4 = 4 - 2 = 2
11–13  P1 (ready queue = P1, P4)          remaining time P1 = 3 - 2 = 1
13–15  P4 (ready queue = P4, P1)          remaining time P4 = 2 - 2 = 0
15–16  P1 (ready queue = P1)              remaining time P1 = 1 - 1 = 0
```

> N.B. Se l'Arrival Time di un processo coincide con il time slice di un processo precedente, prima si mettono in coda i nuovi arrivati, poi si rimette il processo interrotto in fondo alla queue.

---

Dalla timeline mi ricavo i valori di **Start Time** (inizio esecuzione) e **Completion Time** (fine esecuzione) per ognuno dei processi coinvolti. Ad esempio il processo **P1** ha **ST = 0** e **CT = 16**. Dopo aver ricavato il **Completion Time** posso calcolare il **Turnaround Time**, e con quest'ultimo il **Waiting Time**.

| Process | ST  | CT  | TT = CT − AT | WT = TT − BT |
| ------- | --- | --- | ------------ | ------------ |
| P1      | 0   | 16  | 16 − 0 = 16  | 16 − 7 = 9   |
| P2      | 2   | 9   | 9 − 2 = 7    | 7 − 4 = 3    |
| P3      | 6   | 7   | 7 − 4 = 3    | 3 − 1 = 2    |
| P4      | 9   | 15  | 15 − 5 = 10  | 10 − 4 = 6   |

**Turnaround time medio:** (16 + 7 + 3 + 10) / 4 = 9 ms
**Waiting time medio:** (9 + 3 + 2 + 6) / 4 = 5 ms

---

