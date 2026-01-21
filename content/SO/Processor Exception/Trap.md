Le **trap** sono un tipo di **[[Processor Exception|processor exception]]** che si verificano in modo **sincrono**, ovvero come conseguenza diretta dell’esecuzione di un’istruzione del processo. Sono eventi generati dal software stesso e richiedono l’intervento del kernel per eseguire operazioni privilegiate o gestire errori. Tipici esempi sono le **system call**, con cui un programma richiede servizi del sistema operativo, e le **exception**, come divisioni per zero o accessi a memoria non autorizzati. In pratica, le trap permettono al kernel di prendere il controllo **esattamente nel punto in cui il processo ne ha bisogno**, garantendo protezione e correttezza dell’esecuzione.

---
### SYSTEM CALL

**Trap volontarie:** richiesta esplicita di un servizio del sistema operativo. Sono **sincrone** e **innescate dal software** (dal programma utente). Ecco come viene gestita una system call:

---
#### 1. Programma utente

L’utente chiama nel suo programma (user mode) una funzione API, per svolgere delle istruzioni privilegiate (eseguibili solo in kernel mode):

```c
write(fd, buf, 10);
```

Nell'esempio l'utente vuole scrivere 10 byte su un file o dispositivo (istruzione privilegiata).

---
#### 2. Funzione API

Quando il programma viene **compilato** e **linkato**, la chiamata `write()` viene collegata alla **libreria API del sistema operativo**. Questa funzione contiene **istruzioni macchina concrete** che preparano la system call. L'API prepara parametri, inserisce il numero della syscall e provoca la trap con l’istruzione `syscall`.   

Istruzioni in codice macchina nella funzione API corrispondente a alla chiamata dell'esempio:

```assembly
mov rax, SYS_write   ; numero identificativo della syscall
mov rdi, fd          ; primo parametro
mov rsi, buf         ; secondo parametro
mov rdx, 10          ; terzo parametro
syscall              ; istruzione di trap
```

---
#### 3. CPU legge la trap

Quando la CPU esegue l’istruzione `syscall`:

- Riconosce una **trap software sincrona**.
- Salva il contesto del processo (registri, program counter).
- Passa da **user mode → kernel mode**.
- Determina il numero della trap (tipo trap: system call).

---
#### 4. Interrupt Vector Table (IVT)

La IVT è una **tabella in memoria kernel** che associa ogni tipo di trap a una specifica **routine kernel** per quel tipo di trap. 

```r
trap syscall → System Call Handler
```

Nel nostro esempio la CPU prende il tipo di trap (`syscall`) come indice nella tabella e legge l’indirizzo del **System Call Handler** (routine kernel valida per tutte le system call).

---
#### 5. System Call Handler

Il **System Call Handler** è una routine kernel che **gestisce tutte le system call**:

- Legge il **numero della system call** che l’API ha messo in `rax` (ad esempio `SYS_write`).
- Consulta la **System Call Table** per trovare la funzione kernel corrispondente (`sys_write`).
- Chiama la funzione kernel.

---
#### 6. System Call Table

La **System Call Table** è una tabella interna al kernel utilizzata dal System Call Handler per mappare il numero della system call chiamata alla rispettiva funzione kernel di gestione:

```r
0 → sys_read
1 → sys_write
2 → sys_open
...
```

Nel nostro esempio, la CPU/handler legge il numero della syscall (`1` per write) e trova il puntatore a `sys_write`(funzione kernel corrispondente).

---
#### 7. Funzione kernel 

Ora la funzione kernel (`sys_write`) esegue il servizio reale (azioni privilegiate). 

Nel nostro caso: 

- scrive 10 byte sul file o dispositivo
- aggiorna strutture dati del kernel (buffer, file descriptor table)
- gestisce permessi, sincronizzazione, driver hardware.

---
#### 8. Ritorno in user mode

Quando `sys_write` termina:

- Il System Call Handler finisce.
- La CPU ripristina il contesto salvato prima della trap (registri, PC).
- La CPU torna in **user mode**, riprendendo l’esecuzione subito dopo la chiamata `write()`.
- Il valore di ritorno della syscall (numero di byte scritti) viene passato all’API e quindi al programma utente.

---
### EXCEPTION

**Trap involontarie:** gestione di errori o condizioni anomale (es. divisione per zero, accesso a memoria non valida). Sono **sincrone** e **innescate dal software** come conseguenza dell’istruzione eseguita.

---