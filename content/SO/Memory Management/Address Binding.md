Durante l’esecuzione di un [[Program|programma]], la CPU esegue il [[Execution Steps|ciclo di esecuzione]] per ogni istruzione. La maggior parte delle istruzioni comporta il **prelievo** e il **salvataggio di dati in memoria**. I dispositivi di memoria, tuttavia, possono gestire esclusivamente **indirizzi fisici**. È quindi necessario stabilire una corrispondenza tra i **nomi simbolici** utilizzati dai programmi utente e gli **indirizzi fisici reali** della memoria. 

---

**Nomi simbolici:**

Nei programmi utente, le variabili (ad esempio `x`) rappresentano **nomi simbolici**, ossia riferimenti astratti alla memoria che possono indicare sia dati sia istruzioni. Un **nome simbolico** è dunque un riferimento alla memoria usato a livello di programma.

---

**Associazione in memoria:**

Questo nome simbolico viene tradotto in un **indirizzo logico**, cioè un indirizzo generato dalla CPU durante l’esecuzione del programma. L’indirizzo logico viene poi convertito in un **indirizzo fisico**, che rappresenta l’effettiva posizione del dato nella memoria principale.

```q
nome simblico -> indirizzo logico -> indirizzo fisico
```

L’associazione tra indirizzi logici e indirizzi fisici può avvenire secondo tre modalità:

- **Associazione in fase di [[Compile-time Binding|compilazione]] (compile-time)**
- **Associazione in fase di [[Load-time Binding|avvio]] (load-time)**
- **Associazione in fase di [[Run-time Binding|esecuzione]] (run-time)**

---