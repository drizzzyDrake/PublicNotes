Nei sistemi operativi moderni, la CPU deve garantire sia **l’esecuzione sicura dei programmi utente** sia la **gestione efficiente delle risorse hardware**. Per fare ciò, qualsiasi evento che richieda l’intervento del sistema operativo provoca un **passaggio dalla modalità utente ([[Privilege Levels#User mode|user mode]]) alla modalità kernel ([[Privilege Levels#Kernel mode|kernel mode]])**. Questi eventi sono raccolti nella categoria generale delle **processor exception**. Le **processor exception** rappresentano dunque **tutti quegli eventi che interrompono il flusso normale di un programma e richiedono l’attenzione del kernel**. All’interno di questa superclasse possiamo distinguere due grandi sottogruppi:

- **[[Trap|Trap sincrone]]**
- **[[Interrupt|Interrupt asincroni]]**

---
### RELAZIONE TRA TRAP E INTERRUPT

Trap sincrone e interrupt asincroni condividono lo stesso meccanismo di base:

- salvataggio del contesto
- passaggio a kernel mode
- esecuzione di una routine kernel
- ritorno in user mode

La differenza principale è che:

- le **trap sincrone** sono causate dal processo stesso e devono essere gestite immediatamente
- gli **interrupt asincroni** arrivano dall’hardware e possono avvenire in qualsiasi momento

Durante l’esecuzione di codice kernel, il sistema operativo può temporaneamente disabilitare o ritardare interrupt meno prioritari per evitare interferenze.

---
#### Atomicità e sincronizzazione

Poiché interrupt e trap possono verificarsi in qualunque momento, il kernel deve garantire che alcune operazioni critiche non vengano interrotte.

Una sequenza di istruzioni è detta **atomica** se viene eseguita completamente senza possibilità di interruzione. L’atomicità è fondamentale per proteggere dati condivisi del kernel.

La **sincronizzazione** è l’insieme di tecniche che permettono a più processi o routine kernel di cooperare correttamente, evitando condizioni di gara. Il kernel utilizza meccanismi come:

- istruzioni atomiche fornite dall’hardware
- lock e mutex
- semafori

Grazie a questi meccanismi, il sistema operativo può gestire correttamente trap sincrone, interrupt asincroni e concorrenza tra processi.

---
#### Ritorno in user mode

Quando la routine kernel termina:

- il kernel decide quale processo deve riprendere l’esecuzione (scheduler)
- la CPU ripristina il contesto del processo scelto
- la CPU torna in **user mode**

L’esecuzione del programma continua dal punto in cui era stata interrotta, **oppure** dal processo selezionato dallo scheduler.

---