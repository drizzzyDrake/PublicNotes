Un **semaforo** è una **primitiva di sincronizzazione** che generalizza il concetto di lock, permettendo di controllare l’accesso a **una o più risorse condivise**. A differenza di un lock, un semaforo mantiene:

- una **variabile intera**, spiegata più sotto.
- una **coda di attesa** dei thread/processi bloccati.

---
### VARIABILE DEL SEMAPHORE

La variabile intera **S** del semaforo **rappresenta sia le risorse disponibili sia i thread in attesa**, a seconda del suo segno:

- Se **S > 0** la variabile indica **quante risorse libere ci sono** (ad esempio se **S = 1** allora c'è una risorsa libera).
- Se **S = 0** vuol dire che non ci sono risorse disponibili, ma neanche **nessun processo in attesa**.
- Se **S < 0** il valore assoluto della variabile indica **quanti processi sono bloccati in coda**, in attesa di una risorsa (ad esempio se **S = -1** allora c'è un processo in coda).

La variabile **S** può essere incrementata o decrementata dalle primitive fondamentali del semaforo:

---
### PRIMITIVE DEL SEMAPHORE

- il metodo`wait()`(o `P()`): se chiamato in un processo chiede una risorsa da far acquisire a quel processo, dunque decrementa il valore della variabile **S** (meno risorse disponibili/più processi bloccati in coda).
- il metodo `signal()`(o `V()`): se chiamato in un processo comporta la cessione di una risorsa utilizzata fino a quel momento da quel processo, dunque incrementa il valore della variabile **S** (più risorse disponibili/meno processi bloccati in coda).

---
### TIPOLOGIE

I semafori si differenziano in due tipi:

- **Semaforo binario (Mutex):** il valore della variabile può essere solo **0 o 1**. Valore iniziale: **1** Permette l’accesso a **una sola risorsa** alla volta. Il suo comportamento **coincide con quello di un lock**. Usato per garantire **mutua esclusione**.
- **Semaforo di conteggio:** il valore della variabile può assumere **qualsiasi valore intero**. Il valore iniziale corrisponde al numero di risorse disponibili. Thread che chiamano `wait()` decrementano la variabile; se diventa negativa, i thread vengono bloccati in coda. Thread che chiamano `signal()` incrementano la variabile; se ci sono thread bloccati, uno viene sbloccato. Usato per gestire **risorse multiple** (buffer, pool di connessioni, dispositivi).

---
### ESEMPIO

**Assunzioni iniziali:** il semaforo **S** è inizializzato a **2** (due risorse disponibili), la coda del semaforo è inizialmente vuota, con i processi che sono nello stato **ready**.

**Processi:**

```c
A:  S.wait()     | B:  S.wait()
	S.wait()	 |     S.signal()
	S.signal()   |
	S.signal()   |
```

**Tabella d'esecuzione:**

| Operazione eseguita |   S | Coda semaforo | Stato A | Stato B | Commento                                                                                                                                                |
| :------------------ | --: | :------------ | :------ | :------ | :------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Inizio              |   2 | ∅             | Ready   | Ready   | Stato iniziale                                                                                                                                          |
| A:`S.wait()`        |   1 | ∅             | Running | Ready   | A acquisisce la prima risorsa, S decrementa da 2 a 1 (una risorsa disponibile), continua l'esecuzione                                                   |
| B:`S.wait()`        |   0 | ∅             | Running | Running | B acquisisce la seconda risorsa, S decrementa da 1 a 0 (nessuna risorsa disponibile), continua l'esecuzione                                             |
| A:`S.wait()`        |  -1 | [A]           | Blocked | Running | A tenta risorsa, S = 0 dunque nessuna disponibile: A bloccato e messo in coda. S decrementa da 0 a -1 dunque ho 1 processo bloccato in coda (A appunto) |
| B:`S.signal()`      |   0 | ∅             | Running | Ready   | B rilascia la risorsa, S incrementa da -1 a 0, infatti viene liberata una risorsa che viene subito acquisita da A, che si sblocca e esce dalla coda     |
| A:`S.signal()`      |   1 | ∅             | Running | Ready   | A rilascia la sua prima risorsa, S incrementa da 0 a 1 (una risorsa disponibile)                                                                        |
| A:`S.signal()`      |   2 | ∅             | Ready   | Ready   | A rilascia la sua seconda risorsa, S incrementa da 1 a 2 (due risorse disponibili)                                                                      |

> N.B. A e B vengono eseguiti in modo alternato perché lo **scheduler del sistema operativo** assegna la CPU a un solo thread alla volta; quando un thread si **blocca** su `wait()` o viene sbloccato da `signal()`, lo scheduler può **passare l’esecuzione all’altro thread**, creando un’alternanza nell’esecuzione.

---

