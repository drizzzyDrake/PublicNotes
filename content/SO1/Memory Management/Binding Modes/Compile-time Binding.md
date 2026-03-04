Nell’**associazione in fase di compilazione**, gli indirizzi di memoria vengono determinati **durante la compilazione del programma**. Il compilatore genera codice che fa riferimento a **indirizzi fisici assoluti**, assumendo che il programma venga caricato sempre nella stessa posizione di memoria. Di conseguenza:

- Non è richiesta alcuna traduzione dinamica degli indirizzi durante l’esecuzione.
- **Assenza di rilocazione:** gli indirizzi di memoria sono fissati **durante la compilazione**. Il programma non può essere spostato senza **ricompilazione**, perché gli indirizzi fisici sono assoluti e dipendono dalla posizione prevista in memoria.

![[compile-time binding.png]]Questo tipo di associazione è semplice ed efficiente dal punto di vista dell’esecuzione, ma è **poco flessibile** e viene utilizzato solo in contesti molto limitati, come **sistemi embedded** o sistemi con memoria statica e configurazione fissa.

---