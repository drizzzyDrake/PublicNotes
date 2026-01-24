Nei sistemi operativi, la **gestione della memoria** implica assegnare blocchi disponibili ai processi in esecuzione. La memoria può essere frammentata in **blocchi liberi** di varie dimensioni, detti **holes** (buchi), tra blocchi occupati dai processi. 

---
### HOLES

Un **hole** è un blocco di memoria contigua **libera**, disponibile per essere assegnata a un processo. La memoria può contenere più holes di dimensioni diverse, e la strategia di allocazione determina **quale hole scegliere** per un processo che richiede un certo spazio.

---
### ALLOCAZIONE STATICA

L’**allocazione statica della memoria** prevede che la memoria sia suddivisa in **partizioni di dimensione fissa**, definite a priori. Ogni processo viene assegnato a una partizione indipendentemente dal suo reale fabbisogno. Questo metodo è semplice da gestire, ma poco flessibile: se un processo richiede più memoria della partizione disponibile, è necessario **modificare o ricompilare il programma**. L’allocazione statica può causare **[[Memory Fragmentation#FRAMMENTAZIONE INTERNA|frammentazione interna]]**, cioè memoria sprecata all’interno delle partizioni assegnate, e non consente rilocazioni durante l’esecuzione. È tipica dei sistemi semplici o embedded e si collega al **[[Compile-time Binding|compile-time binding]]**, dove gli indirizzi fisici sono fissati a compilazione.

---
### ALLOCAZIONE DINAMICA

L’**allocazione dinamica della memoria** consiste nell’assegnare ai processi **blocchi di memoria durante l’esecuzione**, in base alle loro reali necessità, sfruttando gli spazi liberi (holes) presenti in memoria. Questo metodo è più flessibile rispetto all’allocazione statica e permette **rilocazioni e gestione dinamica della memoria**, riducendo lo spreco iniziale. Tuttavia, può generare problemi di **frammentazione**, a seconda della strategia utilizzata. L’allocazione dinamica può essere:

---

**Allocazione contigua:**  

In questo approccio, i processi vengono assegnati a **blocchi contigui di memoria**. Il sistema operativo sceglie il blocco più adatto tra gli hole disponibili tramite una **policy di allocazione**, come **[[First-fit Policy|first-fit]], [[Best-fit Policy|best-fit]] o [[Worst-fit Policy|worst-fit]]**. Eventuale spazio residuo viene lasciato come nuovo hole. Il problema principale è la **[[Memory Fragmentation#FRAMMENTAZIONE ESTERNA|frammentazione esterna]]**, cioè la presenza di spazi liberi troppo piccoli e non contigui per essere utilizzati dai processi successivi. Questo tipo di allocazione si collega al **[[Load-time Binding|load-time binding]] o [[Run-time Binding|run-time binding]]**, poiché gli indirizzi fisici vengono calcolati al caricamento o durante l’esecuzione.

---

**Allocazione a pagine ([[Paging|paging]]):**  

In questo approccio, la memoria fisica è divisa in **frame di dimensione fissa**, e ogni processo è suddiviso in **pagine** della stessa dimensione. Ogni pagina può essere allocata in **qualsiasi frame libero**, senza necessità di contiguità. La traduzione tra indirizzi virtuali e fisici avviene tramite la **MMU** e le **page table**. La paginazione elimina la **frammentazione esterna**, ma può introdurre una **[[Memory Fragmentation#FRAMMENTAZIONE INTERNA|frammentazione interna]]**, limitata allo spazio inutilizzato all’interno dell’ultima pagina di ciascun processo. Questo meccanismo è alla base dei moderni sistemi di **memoria virtuale**, permettendo l’esecuzione efficiente e sicura di più processi contemporaneamente.

---