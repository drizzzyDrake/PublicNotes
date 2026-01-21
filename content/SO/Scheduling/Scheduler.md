Lo **scheduler** è un **componente del kernel** del sistema operativo che ha il compito di **selezionare quale processo deve utilizzare la CPU** (o un’altra risorsa) in un determinato istante. Opera sulle **[[State Queue|state queue]]**, in particolare sulla **ready queue**, scegliendo un processo da portare nello stato **running**. Lo scheduler entra in funzione in specifici momenti, detti **eventi di scheduling**, come:

- Un processo passa dal **running state** al **waiting state**, ad esempio quando viene effettuata una richiesta I/O oppure viene invocata la syscall `wait()` ([[Scheduling#PREEMPTIVE VS NON-PREEMPTIVE|non-preemptive]]).
- Un processo passa dal **running state** al **ready state**, ad esempio in risposta alla generazione di un [[Interrupt|interrupt]] ([[Scheduling#PREEMPTIVE VS NON-PREEMPTIVE|preemptive]]).
- Un processo passa dal **waiting state** al **ready state**, ad esempio quando viene completata una richiesta I/O oppure viene terminata una [[Trap#SYSTEM CALL|syscall]] `wait()`([[Scheduling#PREEMPTIVE VS NON-PREEMPTIVE|preemptive]]).
- Un processo viene [[Process Creation|creato]] o [[Process Termination|terminato]] ([[Scheduling#PREEMPTIVE VS NON-PREEMPTIVE|non-preemptive]]).

Quando seleziona un processo diverso da quello in esecuzione, lo scheduler avvia un **[[Context Switch|context switch]]**, salvando il contesto del processo uscente e ripristinando quello del processo entrante.  
Lo scheduler è quindi l’**entità operativa** che applica concretamente le decisioni di assegnazione della CPU secondo le regole di [[Scheduling|scheduling]].

---