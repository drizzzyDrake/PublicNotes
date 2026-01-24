L’algoritmo **First Come First Served (FCFS)** è un algoritmo di **CPU scheduling non-preemptive** in cui i **processi**, una volta inseriti nella **ready queue**, vengono ordinati secondo una politica **FIFO**.  
Lo scheduler seleziona il processo che è arrivato per primo e lo esegue **fino a quando termina oppure si blocca volontariamente** (ad esempio per una richiesta di I/O); solo in questi casi lo scheduler viene nuovamente attivato per selezionare il processo successivo. 

---
### PARAMETRI

- <b>ST<sub>1</sub> = AT<sub>1</sub></b> : il primo processo che arriva inizia subito.
- <b>ST<sub>i</sub> = max(CT<sub>i-1</sub>, AT<sub>i</sub>)</b> : i processi successivi al primo, se arrivano prima che sia completata l'esecuzione di quello precedente, devono aspettare che questo finisca.
- <b>CT<sub>i</sub> = ST<sub>i</sub> + BT<sub>i</sub></b> : il tempo totale di completamento dell'esecuzione di un processo equivale alla somma del tempo che ha impiegato ad iniziare con il tempo effettivo di uso della CPU (algoritmo non-preemptive).

---
### ESEMPIO

Calcolare il tempo medio di attesa (WT) e di consegna (TT) con l'algoritmo **First Come First Served** del seguente sistema:

| Process | AT (ms) | CPU BT (ms) |
| ------- | ------- | ----------- |
| P1      | 0       | 7           |
| P2      | 2       | 4           |
| P3      | 4       | 1           |
| P4      | 5       | 4           |

**Evoluzione della ready queue (ms):**

```
0–7    P1 (ready queue = P1, P2, P3, P4)
7–11   P2 (ready queue = P2, P3, P4)
11–12  P3 (ready queue = P3, P4)
12–16  P4 (ready queue = P4)
```

---

Calcolo lo **Start Time** per ogni processo, poi con **Start Time** e **Burst Time** mi ricavo il **Completion Time** di ognuno. Dopo aver ricavato il **Completion Time** posso calcolare il **Turnaround Time**, e con quest'ultimo il **Waiting Time**.

| Process | ST  | CT = ST + BT | TT = CT − AT | WT = TT − BT |
| ------- | --- | ------------ | ------------ | ------------ |
| P1      | 0   | 7            | 7 − 0 = 7    | 7 − 7 = 0    |
| P2      | 7   | 11           | 11 − 2 = 9   | 9 − 4 = 5    |
| P3      | 11  | 12           | 12 − 4 = 8   | 8 − 1 = 7    |
| P4      | 12  | 16           | 16 − 5 = 11  | 11 − 4 = 7   |

**Turnaround time medio:** (7 + 9 + 8 + 11) / 4 = 8.75 ms
**Waiting time medio:** (0 + 5 + 7 + 7) / 4 = 4.75 ms

---
