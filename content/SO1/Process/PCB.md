Il **PCB** (Process Control Block) è una struttura dati del sistema operativo che contiene **tutte le informazioni necessarie per gestire un [[Process|processo]]**. All’avvio di un processo, l’OS alloca un nuovo PCB, aggiungendolo alla [[State Queue|state queue]], per poi de-allocarlo una volta che il processo associato è terminato. Un PCB Contiene tipicamente:

- **PID (Process ID):** identificatore univoco del processo.
- **Stato del processo:** [[Execution State|stato d'esecuzione]].
- **Program Counter:** indirizzo della prossima istruzione da eseguire.
- **Registri della CPU:** salvati durante un [[Context Switch|context switch]].
- **Informazioni di scheduling:** priorità, puntatori alla state queue.
- **Informazioni di memoria:** page table o segmenti, limiti di memoria.
- **Informazioni di I/O:** file aperti dal processo, dispositivi allocati.
- **Informazioni di accounting:** tempo di CPU usato, limiti, proprietario.

---

