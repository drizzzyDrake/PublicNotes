Il parallelismo è un concetto **fisico ed esecutivo** che descrive l’**esecuzione simultanea reale di più flussi di esecuzione**, resa possibile dalla presenza di **più unità di calcolo** (multi-core o multiprocessore). Il parallelismo è quindi **dipendente dall’hardware** e rappresenta un caso particolare della [[Concurrency|concorrenza]], con l’obiettivo di migliorare le prestazioni riducendo il tempo di esecuzione complessivo.
![[multi-core.png]]
> N.B. Su un processore **multi-core** possono essere eseguiti **più thread simultaneamente**, uno per ciascun core; il **context switch** interviene solo quando il numero di thread pronti supera il numero di core disponibili, alternandone l’esecuzione nel tempo su ciascun core.

---