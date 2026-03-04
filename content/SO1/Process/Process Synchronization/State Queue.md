Una **state queue** è la coda in cui il sistema operativo inserisce tutti i processi che si trovano nello stesso [[Execution State|stato]] (Ready, Waiting, ecc.), così da gestirli in modo ordinato. Ogni coda raccoglie i processi in base al loro stato e permette allo [[Scheduler|scheduler]] di selezionare rapidamente quale processo far avanzare. Ogni volta che il **kernel modifica lo stato di un processo**, il [[PCB]] viene **spostato da una coda all’altra**, secondo la transizione di stato.

Ogni **dispositivo I/O** (disco, rete, stampante, ecc.) può avere una **coda dedicata** di processi in attesa del completamento dell’operazione. Quando un processo richiede I/O, il kernel sposta il PCB dalla **running queue** o dalla **ready queue** alla coda del dispositivo. Al completamento dell’I/O, il PCB viene reinserito nella **ready queue** per poter riprendere l’esecuzione.

La **running queue** può contenere al massimo tanti processi quanti sono i **core disponibili** del sistema. Tutte le altre queue (ready, waiting, I/O) **non hanno vincoli sul numero di PCB** e possono crescere in base alle risorse disponibili.

---
