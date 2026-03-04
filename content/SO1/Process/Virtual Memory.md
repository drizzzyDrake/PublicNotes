La **[[ADE/Memory/Virtual Memory|memoria virtuale]]** è un’astrazione che permette a ogni [[Process|processo]] di credere di avere un proprio spazio di memoria continuo indipendente dagli altri processi e più grande della RAM fisica. La memoria virtuale si basa su tre concetti chiave:

---

**Spazio di indirizzamento virtuale**:

Ogni processo vede un proprio spazio, ad esempio:

```
0x00000000 → 0xFFFFFFFF  (32 bit)
```

Questo spazio è **virtuale**, non reale.

---

**Paginazione:**

La memoria è divisa in **[[Paging|pagine]]** (tipicamente 4 KB). Il sistema operativo mantiene una **tabella delle pagine** che mappa:

```
indirizzo virtuale → indirizzo fisico (RAM) oppure su disco
```

---

**Swap / Paging file:**

Quando la RAM è piena, il sistema operativo sposta alcune pagine su disco. Questo permette di eseguire più processi contemporaneamente e di far girare programmi più grandi della RAM. Ovviamente è più lento, ma funziona.

---