L’algoritmo **Multilevel Queue (MLQ)** è un algoritmo di scheduling della CPU basato sull’utilizzo di **più code di ready separate**, ciascuna associata a una **specifica categoria di processi**. Ogni coda adotta **il proprio algoritmo di scheduling**, scelto in base alle caratteristiche della categoria di processi che contiene. Una caratteristica fondamentale del MLQ è che **i processi sono assegnati staticamente a una coda** (un processo non può essere spostato in un’altra). Il problema principale diventa quindi **come schedulare le diverse code tra loro**. Le due politiche più comuni sono:

- **Strict priority**: le code sono ordinate per priorità; **nessun processo appartenente a una coda di priorità più bassa viene eseguito finché esiste almeno un processo pronto in una coda di priorità più alta**. Questa soluzione può causare **starvation** per i processi a bassa priorità.
- **Round Robin tra le code**: a ogni coda viene assegnato un **time slice globale**. Le code vengono servite ciclicamente, e il **time slice assegnato aumenta al diminuire della priorità della coda**, permettendo alle code di priorità più bassa di ottenere comunque tempo di CPU.

---

