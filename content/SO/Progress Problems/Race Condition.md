Una **race condition** è una condizione in cui **il comportamento di un programma dipende dall’ordine o dal timing di esecuzione di più thread o processi concorrenti**, portando a **risultati imprevedibili o errati**.

- si verifica quando **due o più processi/thread accedono simultaneamente a una risorsa condivisa** senza un corretto meccanismo di sincronizzazione;
- il risultato finale **può cambiare di volta in volta** in base all’ordine di accesso;
- può provocare **corruzione dei dati, risultati incoerenti o comportamenti anomali**;
- è tipicamente prevenuta tramite **lock, semafori, mutex o altre primitive di sincronizzazione**;
- **non blocca il sistema** come un deadlock, ma compromette la correttezza dei dati o del programma.

---