La **terminazione di un [[Process|processo]]** è la fase finale del suo ciclo di vita, in cui il processo cessa l’esecuzione e il sistema operativo libera (quasi) tutte le risorse associate.

```
Processo in esecuzione
↓
exit / errore / segnale
↓
Zombie (PCB minimo)
↓
wait() del padre
↓
Rimozione definitiva
```

---
### CAUSE DI TERMINAZIONE

Un processo può terminare per:

- **Terminazione normale:** il programma completa l’esecuzione (`return` da `main`).
- **Terminazione volontaria:** chiamata esplicita a `exit()`.
- **Terminazione per errore:** fatal error (divisione per zero, accesso a memoria invalido).
- **Terminazione forzata:** segnale inviato da un altro processo o dal kernel (es. `kill`).

---
### OPERAZIONI DEL SISTEMA OPERATIVO

Quando un processo termina, il kernel esegue queste operazioni:

1. **Cambio di [[Execution State|stato]]:** `Running / Ready / Waiting → Terminated`.
2. **Chiusura delle risorse:** file aperti, socket, dispositivi I/O.
3. **Rilascio della memoria:** heap, stack, segmenti di codice e dati.
4. **Salvataggio del codice di uscita:** valore restituito a `exit()` (exit status).

> N.B. **il [[PCB]] non viene eliminato subito**.

---
### PROCESSO ZOMBIE

Dopo la terminazione:

- il processo diventa **zombie**
- non occupa CPU né memoria
- rimane una **voce minima nel PCB** (PID + exit status).

Serve per permettere al padre di leggere il risultato.

> zombie = “processo morto, ma non ancora sepolto”

---
### RIMOZIONE DEFINITIVA

Il processo padre chiama `wait()` (o `waitpid()`):

- legge l’**exit status** del figlio;
- il kernel **elimina definitivamente il PCB**;
- il processo scompare dal sistema.

---
### PROCESSO ORFANO

Se il **padre termina prima del figlio**:

- il figlio diventa **orfano**;
- viene adottato da `init` (PID 1);

Il processo [[Init|init]] esegue periodicamente `wait()` per evitare zombie.

---