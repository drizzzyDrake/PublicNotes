L’algoritmo **Lottery Scheduling** è un algoritmo di scheduling **preemptive** basato su un meccanismo di **assegnazione casuale della CPU**, controllato tramite biglietti (tickets). Il suo funzionamento è il seguente:

- A ogni **processo** viene assegnato un certo numero di **biglietti**, che rappresentano la sua probabilità di ottenere la CPU. In genere, i processi che richiedono meno tempo di CPU ricevono più biglietti, mentre quelli più onerosi ne ricevono meno. Per evitare la **starvation**, a ogni processo viene assegnato **almeno un biglietto**.
- Alla scadenza di ogni **time slice**, lo scheduler estrae casualmente un **biglietto vincente**.
- Il **processo che possiede il biglietto estratto** ottiene il controllo della CPU per il time slice successivo.
- Al termine del time slice, la procedura viene ripetuta.

Grazie alla **legge dei grandi numeri**, aumentando il numero di estrazioni, il **tempo di utilizzo della CPU di ciascun processo tende a essere proporzionale al numero di biglietti posseduti**, garantendo una distribuzione equa e flessibile delle risorse.

---