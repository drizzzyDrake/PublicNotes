Nell’**associazione in fase di avvio**, gli indirizzi di memoria vengono tradotti **al momento del caricamento del programma in memoria**, piuttosto che a compilazione. Il compilatore genera **indirizzi logici relativi**, e il **loader** li converte in **indirizzi fisici** aggiungendo un **offset** pari all’indirizzo di base scelto per il programma nella memoria. Di conseguenza:

- L’offset applicato agli indirizzi logici garantisce che **ogni riferimento punti alla corretta posizione fisica**: **Indirizzo fisico = Indirizzo logico + Base di caricamento scelta dal loader**.
- **Rilocazione statica:** Il programma può essere caricato in posizioni diverse senza ricompilazione, ma **una volta avviato non può spostarsi**, se deve cambiare posizione, va **riavviato**.

![[load-time binding.png]]
Questo metodo offre maggiore flessibilità rispetto alla binding a compile-time in quanto evita conflitti tra programmi e permette di gestire più programmi contemporaneamente in memoria Tuttavia **non supporta rilocazione dinamica** né tecniche avanzate come lo swapping o la memoria virtuale.

---