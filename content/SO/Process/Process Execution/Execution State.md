Lo **stato di esecuzione un [[Process|processo]]** indica la fase del suo ciclo di vita. I principali stati sono:

- **New:** Il processo è stato creato ma non è ancora pronto per l’esecuzione.
- **Ready:** Il processo è pronto a essere eseguito e attende di essere schedulato nella CPU.
- **Running:** La CPU sta attualmente eseguendo il processo.
- **Waiting / Blocked:** Il processo è sospeso in attesa di un evento (es. I/O, segnale).
- **Terminated:** Il processo ha completato l’esecuzione e l'OS può eliminarlo.

---

**Transizioni tipiche:**
![[process state.png]]
Lo **stato del processo** è **uno dei campi del [[PCB]]**. Durante un **[[Context Switch|context switch]]**, il sistema operativo salva lo stato della CPU nel PCB del processo uscente e ripristina quello del processo entrante. La gestione delle transizioni segue le **politiche dello [[Scheduler|scheduler]]** e garantisce che i processi avanzino correttamente tra gli stati.

---