Il **Garbage Collector (GC) in Java** è il meccanismo automatico che gestisce la memoria liberando gli oggetti che non sono più utilizzati da un programma. In **Java**, la memoria degli oggetti viene allocata sull’**[[Java Memory Model#HEAP|heap]]**. Il Garbage Collector:

- individua gli **oggetti non più raggiungibili** (non referenziati),
- libera la memoria occupata,
- riduce errori come **memory leak** e **dangling pointer**.

In questo modo lo sviluppatore **non deve allocare e de-allocare manualmente** la memoria.

---