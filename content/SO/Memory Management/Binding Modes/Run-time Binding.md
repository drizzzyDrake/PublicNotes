Nell’**associazione in fase di esecuzione**, la traduzione dagli **indirizzi logici** agli **indirizzi fisici** avviene **durante l’esecuzione del programma**, e non prima. Questo richiede un **hardware dedicato**, tipicamente la **Memory Management Unit ([[CPU Units#MMU (Memory Management Unit)|MMU]])**, che calcola dinamicamente l’indirizzo fisico corrispondente a ciascun indirizzo logico ogni volta che la CPU accede alla memoria. Di conseguenza:

- L’MMU applica un **offset o una traduzione dinamica** per ottenere l’indirizzo fisico corretto, **Indirizzo fisico = Indirizzo logico + Base di caricamento scelta dalla MMU**.
- **Rilocazione dinamica:** consente al programma di essere **completamente rilocabile**, supportando spostamenti in memoria, isolamento dei processi e memoria virtuale senza modificare l’immagine binaria (in fase di esecuzione, senza bisogno di riavvio).


![[run-time binding.png]]
Questo meccanismo permette una **gestione efficiente della memoria**, condividendo aree comuni tra processi e isolando ciascun processo dagli altri. Necessita di un **overhead minimo** per ogni accesso alla memoria, ma garantisce **massima flessibilità e sicurezza**. E' alla base di sistemi moderni con **memoria virtuale** e **multitasking preemptive**, dove i programmi possono essere caricati, spostati e eseguiti in qualsiasi parte della memoria senza modificarne il codice.

---