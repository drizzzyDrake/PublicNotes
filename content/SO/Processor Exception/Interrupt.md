Gli **interrupt** sono un tipo di **[[Processor Exception|processor exception]]** che si verifica in modo **asincrono**, cioè indipendentemente dal flusso delle istruzioni del processo. Sono generati dall’hardware, come timer, dispositivi di I/O o altre periferiche, e segnalano al kernel che è necessario un intervento. Gli interrupt consentono al sistema operativo di gestire eventi esterni, implementare lo **scheduling dei processi** e garantire la reattività del sistema, pur senza che il processo in esecuzione li abbia richiesti direttamente.

---
### TIMER HARDWARE

Il più importante è l’**interrupt del timer**. Il **timer hardware** è un componente della CPU o del sistema che genera interrupt a intervalli regolari. Il suo scopo è impedire che un processo monopolizzi la CPU e permettere la **multiprogrammazione**.

**Quando scatta un interrupt del timer:**

- la CPU interrompe il processo in esecuzione
- salva il suo contesto
- entra in kernel mode
- esegue la routine kernel associata al timer

Questo interrupt dà al kernel la possibilità di avviare lo **scheduler**.

---
### SCHEDULER E TIME SLICE

Lo **[[Scheduler|scheduler]]** è una componente del kernel che decide **quale processo deve usare la CPU**. I processi sono organizzati in base al loro [[Execution State|stato]]. Ogni processo in esecuzione dispone di un **time slice**, cioè una piccola porzione di tempo durante la quale può utilizzare la CPU prima che il kernel valuti se interromperlo per dare spazio ad altri processi. Durante un interrupt del timer, lo scheduler verifica se il processo corrente ha esaurito il suo time slice. In base a questo controllo può decidere:

- di continuare a eseguire lo stesso processo (time slice non ancora scaduto)
- oppure di sospenderlo e selezionare un altro processo dalla [[State Queue|coda]] dei pronti (time slice scaduto)

> N.B. Non è detto che **ogni interrupt del timer** produca un cambio di processo, ma ogni interrupt rende possibile lo scheduling.

---