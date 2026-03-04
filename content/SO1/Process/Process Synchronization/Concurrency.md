La concorrenza è un concetto **logico e progettuale** che descrive la presenza di **più flussi di esecuzione ([[Process|processi]] o [[SO1/Process/Process Synchronization/Thread|thread]]) attivi nello stesso intervallo di tempo**, che possono avanzare in modo intercalato o cooperativo. Essa è **indipendente dall’hardware** e può essere realizzata anche su sistemi single-core tramite meccanismi di [[Scheduling|scheduling]] (come time slicing) e [[Context Switch|context switch]]; introduce la necessità di gestire correttamente la sincronizzazione e l’accesso a risorse condivise.
![[single-core.png]]
> N.B. Su un processore single-core viene eseguito un solo thread per volta, ma più thread possono essere gestiti tramite context switch, che ne alterna l’esecuzione nel tempo.

---