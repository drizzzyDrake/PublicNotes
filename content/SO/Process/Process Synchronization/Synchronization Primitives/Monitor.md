Un monitor è un costrutto dei linguaggi di programmazione in grado di controllare l’accesso ai dati condivisi. In particolare, tramite tale costrutto, il codice relativo alla sincronizzazione viene inserito direttamente dal compilatore e imposto dal runtime stesso del linguaggio utilizzato. I processi che tentano di accedere al monitor vengono messi all’interno di una **queue**. Formalmente, un monitor è costituito da:

- un **lock**, utilizzato per assicurare la mutua esclusione sui dati condivisi e sui thread, 
- zero o più **variabili di condizione**, utilizzate per gestire gli accessi concorrenti ai dati condivisi.

---
### MUTUA ESCLUSIONE AUTOMATICA

- Quando un thread entra in una procedura del monitor, **acquisisce automaticamente il lock** associato al monitor.
- Quando la procedura termina, il lock viene **rilasciato** automaticamente.
- Questo garantisce che **due thread non possono eseguire contemporaneamente** codice all’interno del monitor, evitando race condition sui dati condivisi.

---
### VARIABILI DI CONDIZIONE

Un monitor può avere **zero o più variabili di condizione** associate ad esso, usate per la **sincronizzazione tra thread** quando condizioni specifiche non sono soddisfatte. Una variabile di condizione fornisce le seguenti primitive di sincronizzazione:

- Il metodo **`wait()`**: il processo che lo chiama **rilascia il lock del monitor**, si mette in attesa su una **coda associata** alla variabile di condizione, viene bloccato finché un altro processo non effettua `signal()`. Ovviamente, prima di riprendere l’esecuzione, **riacquisisce il lock**. 
- Il metodo **`signal()`** (o `notify()`) : se ci sono thread in attesa su quella variabile **uno solo viene svegliato** e posto in stato **Ready**. Se non ci sono thread in attesa, il segnale **non ha effetto** (non viene “memorizzato”).
- Il metodo **`broadcast()`** (o `notifyAll()`): sveglia **tutti** i thread in attesa sulla condizione. 

Durante lo svolgimento di un’operazione (metodo) su variabili di condizione, è necessario che il **lock** rimanga chiuso.

---
### SEMANTICHE DI MONITOR

Esistono due principali semantiche per l’implementazione di `wait()` e `signal()` nei monitor:

---
#### Hoare Monitors

- Quando un thread segnala (`signal()`), il **thread segnalato entra immediatamente nel monitor** e ottiene il lock.
- Il thread che ha fatto `signal()` **cede il controllo** e viene sospeso finché il thread sbloccato non termina o si blocca.
- Questo garantisce che la condizione attesa sia vera **al momento della ripresa**.

---
#### Mesa Monitors

- Quando un thread segnala (`signal()`), il thread segnalato viene **messo in coda Ready** per il lock, ma **non ottiene immediatamente il controllo**.
- Il thread che ha fatto il signal continua ad eseguire nel monitor.
- Il thread sbloccato **deve contendere il lock** con altri thread quando ritorna.
- Questa è la semantica usata nella maggior parte dei linguaggi moderni (es. Java). 

---
