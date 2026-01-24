Attraverso il meccanismo di **[[Paging|paging]]** La memoria virtuale viene suddivisa in **pagine**, che vengono associate a blocchi di memoria fisica tramite apposite strutture chiamate **tabelle delle pagine**. Quando un processo accede a un indirizzo virtuale, la MMU traduce quell’indirizzo nell’indirizzo fisico corrispondente. Se la pagina richiesta non è presente in RAM, il sistema operativo può recuperarla dal disco (swap), garantendo così che i programmi possano utilizzare più memoria di quella fisicamente disponibile. 

---
