L’algoritmo **Shortest Job First (SJF)** è un algoritmo di **CPU scheduling** che assegna la CPU al processo con il **CPU burst stimato più breve**, riducendo il tempo medio di attesa. Può essere:

- **Non-preemptive**: ogni processo che ottiene la CPU viene eseguito **fino al completamento** del suo burst CPU.
- **Preemptive** (detto anche **Shortest Remaining Time First, SRTF**): se un nuovo processo arriva nella **ready queue** e il suo burst stimato è **minore del burst rimanente** del processo corrente, lo scheduler **interrompe** il processo in esecuzione e assegna la CPU al nuovo processo.

Lo SJF **richiede una stima del CPU burst**, che può essere calcolata mediante tecniche di predizione basate sui burst passati. La versione preemptive (SRTF) è più efficiente nel ridurre il **turnaround time medio**, ma può causare **starvation** per processi con burst lunghi se arrivano continuamente processi più corti (i processi con **CPU burst lungo** rischiano di **non ottenere mai la CPU**).

---
### PARAMETRI

#### (SJF non-preemptive)

- <b>ST<sub>1</sub> = AT<sub>1</sub></b> : il primo processo che arriva inizia subito.
- <b>ST<sub>i</sub> = max(CT<sub>i-1</sub>, AT<sub>i</sub>)</b> : i processi successivi al primo, se arrivano prima che sia completata l'esecuzione di quello precedente, devono aspettare che questo finisca.
- <b>CT<sub>i</sub> = ST<sub>i</sub> + BT<sub>i</sub></b> : il tempo totale di completamento dell'esecuzione di un processo equivale alla somma del tempo che ha impiegato ad iniziare con il tempo effettivo di uso della CPU (algoritmo non-preemptive).

---
#### (SRTF preemptive)

<b>CT<sub>i</sub> ≠ ST<sub>i</sub> + BT<sub>i</sub></b> in generale, perché il processo può essere **interrotto più volte** a causa del **time slice**. Per calcolare **CT** bisogna **seguire tutta la timeline**, sommare tutti i periodi di CPU che il processo ha effettivamente eseguito fino al completamento (algoritmo preemptive).

---
### ESEMPIO 

#### (SJF non-preemptive)

Calcolare il tempo medio di attesa (WT) e di consegna (TT) con l'algoritmo **Shortest Job First** del seguente sistema:

| Process | AT (ms) | CPU BT (ms) |
| ------- | ------- | ----------- |
| P1      | 0       | 7           |
| P2      | 2       | 4           |
| P3      | 4       | 1           |
| P4      | 5       | 4           |

**Evoluzione della ready queue (ms):**

```
0–7    P1 (ready queue = P1, P3, P2, P4) 
7–8    P3 (ready queue = P3, P2, P4)
8–12   P2 (ready queue = P2, P4)
12–16  P4 (ready queue = P4)
```

> N.B. P1, pur avendo Burst Time più alto di tutti, viene comunque eseguito per primo, in quanto a t = 0 ms, P1 è l'unico processo all'interno della ready queue. Durante l'esecuzione di P1 entrano nella ready queue tutti gli altri processi, che vengono disposti per Burst Time più basso. 

---

Calcolo lo **Start Time** per ogni processo, poi con **Start Time** e **Burst Time** mi ricavo il **Completion Time** di ognuno. Dopo aver ricavato il **Completion Time** posso calcolare il **Turnaround Time**, e con quest'ultimo il **Waiting Time**.

| Process | ST  | CT = ST + BT | TT = CT − AT | WT = TT − BT |
| ------- | --- | ------------ | ------------ | ------------ |
| P1      | 0   | 7            | 7 − 0 = 7    | 7 − 7 = 0    |
| P3      | 7   | 8            | 8 − 4 = 4    | 4 − 1 = 3    |
| P2      | 8   | 12           | 12 − 2 = 10  | 10 − 4 = 6   |
| P4      | 12  | 16           | 16 − 5 = 11  | 11 − 4 = 7   |

**Turnaround time medio:** (7 + 4 + 10 + 11) / 4 = 8 ms  
**Waiting time medio:** (0 + 3 + 6 + 7) / 4 = 4 ms

---
#### (SRTF preemptive)

Calcolare il tempo medio di attesa (WT) e di turnaround (TT) con l'algoritmo **Shortest Remaining Time First** del seguente sistema (non c'è time slice fisso):

|Process|AT (ms)|CPU BT (ms)|
|---|---|---|
|P1|0|7|
|P2|2|4|
|P3|4|1|
|P4|5|4|

**Evoluzione della ready queue (ms):**

```
0–2    P1 (ready queue = P1, P2)          remaining time P1 = 7 - 2 = 5
2–4    P2 (ready queue = P2, P3, P1)      remaining time P2 = 4 - 2 = 2
4–5    P3 (ready queue = P3, P2, P4, P1)  remaining time P3 = 1 - 1 = 0
5–7    P2 (ready queue = P2, P4, P1)      remaining time P2 = 2 - 2 = 0
7–11   P4 (ready queue = P4, P1)          remaining time P4 = 4 - 4 = 0
11–16  P1 (ready queue = P1)              remaining time P1 = 5 - 5 = 0
```

> N.B. Quando arriva un nuovo processo con remaining time più breve, si blocca l'esecuzione del processo corrente, che viene rimesso in coda nella ready queue in base al suo remaining time. Ad esempio: a t = 0 ms inizia l'esecuzione di P1. A t = 2 ms entra nella ready queue P2: P2 remaining time = 4 (= Burst Time, appena entrato) < P1 remaining time =  7 - 2 = 5 ms, dunque P2 passa ad essere eseguito al posto di P1, che viene messo in coda.

---

Dalla timeline mi ricavo i valori di **Start Time** (inizio esecuzione) e **Completion Time** (fine esecuzione) per ognuno dei processi coinvolti. Ad esempio il processo **P1** ha **ST = 0** e **CT = 16**. Dopo aver ricavato il **Completion Time** posso calcolare il **Turnaround Time**, e con quest'ultimo il **Waiting Time**.

|Process|ST|CT|TT = CT − AT|WT = TT − BT|
|---|---|---|---|---|
|P1|0|16|16 − 0 = 16|16 − 7 = 9|
|P2|2|7|7 − 2 = 5|5 − 4 = 1|
|P3|4|5|5 − 4 = 1|1 − 1 = 0|
|P4|7|11|11 − 5 = 6|6 − 4 = 2|

**Turnaround time medio:** (16 + 5 + 1 + 6) / 4 = 7 ms  
**Waiting time medio:** (9 + 1 + 0 + 2) / 4 = 3 ms

---
