Indipendentemente dal sistema operativo, la creazione di un [[Process|processo]] segue uno schema logico ben preciso:

1. **Richiesta di creazione:** fatta da un altro processo (padre) o dal sistema.
2. **Creazione del [[PCB]]:** assegnazione PID e inizializzazione dello **[[Execution State|stato]]**.
3. **Allocazione risorse:** **[[SO/Process/Virtual Memory|memoria]]** (codice, dati, stack, heap), file e **[[IO Devices|dispositivi]]**.
4. **Caricamento del [[Program|programma]]:** il codice eseguibile viene caricato in memoria.
5. **Inserimento nello [[Scheduler|scheduler]]:** stato = **Ready**, il processo attende la CPU.

Le differenze tra sistemi operativi riguardano **come** questi passi vengono realizzati.

---
### METODO UNIX/LINUX

Nei sistemi Unix/Linux la creazione avviene in **due fasi separate**:

```
fork()  → crea il processo
exec()  → carica il programma
```

---
#### Duplicazione del processo

La [[Trap#SYSTEM CALL|system call]] `fork()` crea un **nuovo processo figlio** copiando il processo padre.

Caratteristiche:

- il figlio è una **copia quasi identica** del padre;
- ha **PID diverso**;
- esegue **la stessa istruzione successiva a `fork()`**;
- usa **Copy-on-Write**: la memoria non viene copiata subito, la copia avviene solo se uno dei due processi modifica una pagina.
- Valore di ritorno: padre → PID del figlio, figlio → 0

> `fork()` = “clona me stesso”

---
#### Sostituzione del programma

Dopo `fork()`, il figlio di solito chiama `exec()`.

Effetto:

- il **programma in memoria viene completamente sostituito**;
- il **PID resta lo stesso**;
- il nuovo programma parte dall’inizio;
- file aperti restano aperti (se non diversamente specificato).

> `exec()` = “cancella quello che sono e diventa un altro programma”

---
### METODO WINDOWS

Nei sistemi Windows la creazione avviene **in un solo passo**.

```
pawn()  → crea il processo con il nuovo programma
```

---
#### Creazione del processo

Windows usa una system call concettualmente equivalente a **spawn** (in pratica `CreateProcess()`).

Caratteristiche:

- **non esiste duplicazione del processo chiamante**;
- il nuovo processo viene creato **direttamente** con: nuovo PCB, nuova memoria, nuovo programma caricato subito;
- nessuna esecuzione condivisa di codice iniziale.

> `spawn()` = “crea un nuovo processo già pronto con quel programma”

---