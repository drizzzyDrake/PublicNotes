Dato un alfabeto $\Sigma$, definiamo come espressione regolare di $\Sigma$ una stringa $R$ rappresentante un linguaggio $L(R) \subseteq \Sigma^*$. In altre parole, ogni espressione regolare $R$ rappresenta in realtà il linguaggio $L(R)$ ad essa associata. In particolare, definiamo l’insieme delle espressioni regolari di $\Sigma$, indicato con $\text{re}(\Sigma)$, come:

- $a \in \text{re}(\Sigma)$ dove $a \in \Sigma$,
- $\varepsilon  \in \text{re}(\Sigma)$,
- $\emptyset  \in \text{re}(\Sigma)$,
- $R_1, R_2 \in \text{re}(\Sigma) \implies (R_1 \cup R_2) \in \text{re}(\Sigma)$,
- $R_1, R_2 \in \text{re}(\Sigma) \implies (R_1 \circ R_2) \in \text{re}(\Sigma)$,
- $R_1 \in \text{re}(\Sigma) \implies R_1^* \in \text{re}(\Sigma)$.

> [!tip] 
> Osserviamo come, dalla definizione:
> - $R = a \in \text{re}(\Sigma), a \in \Sigma \implies L(R) = \{a\}$,
> - $R = \varepsilon  \in \text{re}(\Sigma) \implies L(R) = \{\varepsilon\}$,
> - $R = \emptyset  \in \text{re}(\Sigma) \implies L(R) = \emptyset$,
> - $R = R_1 \cup R_2 \in \text{re}(\Sigma) \implies L(R) = L(R_1) \cup L(R_2)$,
> - $R = R_1 \circ R_2 \in \text{re}(\Sigma) \implies L(R) = L(R_1) \circ L(R_2)$,
> - $R = R_1^* \in \text{re}(\Sigma) \implies L(R) = L(R_1)^*$.

---
### REGOLE E IDENTITÀ

Quando si valuta un'espressione regolare senza parentesi, le operazioni si applicano secondo la seguente gerarchia (dalla più forte alla più debole): $* \succ \circ \succ \cup$. Inoltre, nelle operazioni che comprendono $\varepsilon$ e $\emptyset$, riconosciamo le seguenti identità:

$$
\begin{array}{|l|l|l|}
\hline
\textbf{Elemento} & \textbf{Descrizione} & \textbf{Regola} \\ 
\hline 
\text{Insieme Vuoto } (\emptyset) & \text{Elemento neutro dell'unione} & R \cup \emptyset = R \\ 
& \text{Elemento assorbente della concatenazione} & R \circ \emptyset = \emptyset \\ 
& \text{Chiusura di Kleene dell'insieme vuoto} & \emptyset^* = \varepsilon \\  \hline
\text{Stringa Vuota } (\varepsilon) & \text{Elemento neutro della concatenazione} & R \circ \varepsilon = R \\
& \text{Chiusura di Kleene della stringa vuota} & \varepsilon^* = \{\varepsilon\} \\
\hline
\end{array}
$$

Nota come il simbolo di concatenazione viene omesso nella stesura delle espressioni.

> [!example]
> Negli esempi seguenti assumiamo che l'alfabeto $\Sigma$ sia $\{0,1\}$:
> - $0^*10^* = \{w\ |\ w \text{ contiene un solo } 1\}$
> - $\Sigma^*1\Sigma^* = \{w\ |\ w \text{ ha almeno un } 1\}$
> - $\Sigma^*001\Sigma^* = \{w\ |\ w \text{ contiene la stringa } 001 \text{ come sottostringa}\}$
> - $(\Sigma\Sigma)^* = \{w\ |\ w \text{ è una stringa di lunghezza pari}\}$
> - $(\Sigma\Sigma\Sigma)^* = \{w\ |\ w \text{ è una stringa che ha lunghezza multipla di 3}\}$
> - $01 \cup 10 = \{01,10\}$
> - $0\Sigma^*0 \cup 1\Sigma^*1 \cup 0 \cup 1 = \{w\ |\ w \text{ inizia e termina con lo stesso simbolo}\}$
> - $(0 \cup \varepsilon)1^* = 01^* \cup \varepsilon1^* = 01^* \cup 1^*$
> - $(0 \cup \varepsilon)(1 \cup \varepsilon) = \{\varepsilon,0,1,01\}$
> - $1^*\emptyset = \emptyset$ 
> - $\emptyset^* = \{\varepsilon\}$

---
### AUTOMA GENERALIZZATO

Un **Automa Finito Non Deterministico Generalizzato**, in inglese **Generalized Non-deterministic Finite Automaton (GNFA)**, è una variante degli [[Finite Automaton#AUTOMA NON DETERMINISTICO|NFA]] in cui le transizioni non sono etichettate con simboli dell'alfabeto, bensì con **espressioni regolari**. Come negli NFA, anche nei GNFA una stringa è accettata se esiste almeno un cammino che conduce dallo stato iniziale a uno stato accettante.

---
#### Definizione formale di GNFA

Un **Automa Finito Non Deterministico Generalizzato**, in inglese **Generalized Non-deterministic Finite Automaton (GNFA)**, è una quintupla $(Q,\Sigma,\delta,q_{\text{start}},q_{\text{accept}})$ dove:

- $Q$ è l'**insieme finito degli stati** dell'automa,
- $\Sigma$ è l'**alfabeto** dell'automa,
- $\delta : (Q-{q_{\text{accept}}}) \times (Q-{q_{\text{start}}}) \rightarrow \mathrm{re}(\Sigma)$ è la **funzione di transizione degli stati** dell'automa,
- $q_{\text{start}}\in Q$ è lo **stato iniziale** dell'automa,
- $q_{\text{accept}}\in Q$ è l'unico **stato accettante** dell'automa.

> [!important]
> A differenza degli NFA, la funzione di transizione **non restituisce un insieme di stati**, bensì un'**espressione regolare**. Ogni arco del GNFA è quindi etichettato con un'espressione regolare appartenente a $\mathrm{re}(\Sigma)$.

---
#### Forma canonica di un GNFA

Assumeremo sempre che un GNFA sia nella seguente forma canonica:

- esiste un unico stato iniziale $q_{\text{start}}$, che **non possiede archi entranti**,
- esiste un unico stato accettante $q_{\text{accept}}$, che **non possiede archi uscenti**,
- tra ogni coppia di stati (compreso uno stato verso sé stesso) esiste esattamente un arco. Qualora nell'automa non fosse presente alcuna transizione, tale arco viene etichettato con $\emptyset$.

![[gnfa example.png]]

> [!Example]
> L'automa in figura è un esempio di GNFA in forma canonica.

---
#### Condizione di accettazione nei GNFA

Data una stringa $w=w_1w_2\cdots w_k$, dove $w_i\in\Sigma^*$ (ossia sono delle sotto-stringhe), diciamo che un GNFA accetta la stringa $w$ se esiste una sequenza di stati $q_0,q_1,\ldots,q_k$ tale che:

- stato iniziale: $q_0=q_{start}$
- stato finale: $q_k=q_{accept}$
- per ogni $i$ vale $w_i\in L(R_i)$, dove $R_i=\delta(q_{i-1},q_i)$

In altre parole, a differenza di un normale NFA in cui ci si muove stato per stato leggendo un solo carattere alla volta tramite singoli simboli o stringhe vuote, il GNFA ragiona su scala più ampia: la stringa viene scomposta in blocchi consecutivi e, per passare da uno stato al successivo, ciascun blocco $w_i$ deve essere una stringa valida riconosciuta dall'espressione regolare $R_i$ che etichetta l'arco percorso.

> [!example] 
> Il GNFA dell’esempio precedente accetta la stringa $\text{ababaaaba}$, poiché:
> - $\delta(q_\text{start}, q_2) = \text{ab}^∗$, dunque viene letta in blocco la sottostringa $\text{abab}$,
> -  $\delta(q_2, q_2) = \text{(aa)}^∗$, dunque viene letta in blocco la sottostringa $\text{aa}$,
> - $\delta(q_2, q_\text{accept}) = \text{ab} \cup \text{ba}$, dunque viene letta in blocco la sottostringa $\text{ba}$.

---
### DA NFA A ESPRESSIONE REGOLARE

Per ottenere un'espressione regolare equivalente a un NFA di partenza, la conversione viene effettuata in due fasi. Prima si trasforma l'NFA in un GNFA equivalente, e poi si applica la procedura **CONVERT** al GNFA appena ottenuto.

---
#### Conversione da NFA a GNFA

Come abbiamo appena detto, poiché la procedura **CONVERT** opera su un GNFA, è necessario trasformare preliminarmente l'NFA (o, equivalentemente, il DFA) in un GNFA equivalente. La trasformazione consiste nei seguenti punti:

- aggiungere $q_{\text{start}}$ con un $\varepsilon$-arco verso il precedente stato iniziale,
- aggiungere $q_{\text{accept}}$ con un $\varepsilon$-arco proveniente da ciascun precedente stato accettante,
- rimuovere la proprietà di stato iniziale dal precedente stato iniziale e quella di stato accettante dai precedenti stati finali,
- aggiungere un arco tra ogni coppia di stati. Se nell'automa originale non è presente alcuna transizione, l'arco viene etichettato con $\emptyset$.

Il GNFA ottenuto riconosce lo stesso linguaggio dell'NFA di partenza (è equivalente).

---
#### Conversione da GNFA a espressione regolare

Una volta ottenuto il GNFA equivalente dall'NFA di partenza possiamo applicare la **procedura CONVERT** per ottenere l'espressione regolare finale. Sia $G=(Q,\Sigma,\delta,q_{\text{start}},q_{\text{accept}})$ un GNFA, la procedura CONVERT restituisce un'espressione regolare equivalente a $G$.

- **Caso base:** se il GNFA è costituito solamente dallo stato iniziale $q_{\text{start}}$ e dallo stato accettante $q_{\text{accept}}$, allora esiste un unico arco tra i due stati, etichettato con $R=\delta(q_{\text{start}},q_{\text{accept}})$. La procedura restituisce direttamente l'espressione regolare $R$.
- **Passo ricorsivo:** se il GNFA possiede più di due stati, scegliamo arbitrariamente uno stato $q_{\text{rip}}\neq q_{\text{start}},q_{\text{accept}}$ e lo eliminiamo. Otteniamo dunque $G' = (Q',\Sigma,\delta',q_{\text{start}},q_{\text{accept}})$, dove $Q'=Q-\{q_{\text{rip}}\}$. L'eliminazione di $q_{\text{rip}}$ richiede di aggiornare tutte le etichette degli archi tra gli stati rimanenti. Quindi, per ogni coppia di stati rimanenti $q_i\in Q'-\{q_{\text{accept}}\}$ e $q_j\in Q'-\{q_{\text{start}}\}$, definiamo $R_1=\delta(q_i,q_{\text{rip}})$, $R_2=\delta(q_{\text{rip}},q_{\text{rip}})$, $R_3=\delta(q_{\text{rip}},q_j)$, $R_4=\delta(q_i,q_j)$. Il termine $(R_1)(R_2)^*(R_3)$ rappresenta tutti i percorsi che passano attraverso $q_{\text{rip}}$, eventualmente visitandolo più volte grazie al ciclo $R_2$, mentre il termine $(R_4)$ rappresenta il percorso diretto da $q_i$ a $q_j$. Dunque, la funzione di transizione del nuovo GNFA è definita come $\delta'(q_i,q_j)= (R_1)(R_2)^*(R_3)\cup(R_4)$. 

![[convert.png]]

Una volta aggiornate tutte le etichette degli archi, la procedura viene applicata ricorsivamente al nuovo GNFA $G'$. Il procedimento termina quando rimangono solamente lo stato iniziale e lo stato accettante (caso base). L'etichetta $R$ dell'unico arco rimanente rappresenta l'espressione regolare equivalente al GNFA iniziale.

---
#### Esempio di conversione da NFA a espressione regolare


> [!example] 
> Convertiamo il seguente NFA in un'espressione regolare equivalente.

![[from nfa to re example.png]]
![[from nfa to re example 1.png]]
![[from nfa to re example 2.png]]

---
### EQUIVALENZA CON GLI AUTOMI FINITI

Le espressioni regolari e gli automi finiti sono equivalenti rispetto alla loro potenza descrittiva: ogni espressione regolare può essere trasformata in un automa finito che riconosce il linguaggio che essa descrive, e viceversa (ricorda il [[Finite Automaton#LINGUAGGI REGOLARI|teorema]]).

> [!quote] Theorem
> Un linguaggio $A \subseteq \Sigma^*$ è [[Regular Languages|regolare]] se e solo se esiste un'espressione regolare $R \in \text{re}(\Sigma)$ tale che $L(R) = A$.

**Dimostrazione:**

Dimostriamo il primo lemma:

> [!quote] Lemma
> Se un linguaggio $A$ è descritto da un'espressione regolare $R \in \text{re}(\Sigma)$ (ovvero $A = L(R)$), allora $A$ è un linguaggio regolare (ossia esiste un NFA $N$ tale che $L(N) = L(R)$).

Procediamo per induzione strutturale sulla complessità dell'espressione regolare $R \in \text{re}(\Sigma)$. 

Caso base:

![[lemma 1 base case re equivalent nfa.png]]

- Se $R = \emptyset$: dalla definizione si ha $L(R) = \emptyset$. Definiamo l'NFA $N_\emptyset$ = $(\{q_0\}, \Sigma, \delta, q_{0}, \emptyset)$, dove $\delta(q_0,b) = \emptyset$ per ogni $b \in \Sigma$. Dal momento in cui non ci sono sono stati di accettazione, possiamo dire che $L(N_\emptyset) = \emptyset = L(R)$.
- Se $R = \varepsilon$: dalla definizione si ha $L(R) = \{\varepsilon\}$. Definiamo l'NFA $N_\varepsilon$ = $(\{q_0\}, \Sigma, \delta, q_{0}, \{q_0\})$, dove $\delta(q_0,b) = \emptyset$ per ogni $b \in \Sigma$. Dal momento in cui l'automa accetta solo la stringa vuota $\varepsilon$, possiamo dire che $L(N_\varepsilon) = \{\varepsilon\} = L(R)$.
- Se $R = a$: dalla definizione si ha $L(R) = \{a\}$. Definiamo l'NFA $N_a$ = $(\{q_0,q_1\}, \Sigma, \delta, q_{0}, \{q_1\})$, dove $\delta(q_0,a) = \{q_1\}$ e $\delta(r,b) = \emptyset$. Dal momento in cui l'automa accetta solo la stringa formata dal simbolo $a$, possiamo dire che $L(N_a) = \{a\} = L(R)$.

Passo induttivo:

Ipotesi induttiva: assumiamo che per le espressioni regolari $R_1, R_2 \in \text{re}(\Sigma)$ valga la proprietà, ossia che esistano due NFA $N_1$ e $N_2$ tali che: $L(N_1) = L(R_1)$ e $L(N_2) = L(R_2)$. Mostriamo che la proprietà vale anche per i composti formati dalle operazioni regolari:

- Se $R = R_1 \cup R_2$: dalla definizione si ha $L(R) = L(R_1) \cup L(R_2)$. Per ipotesi induttiva, $L(R_1)$ e $L(R_2)$ sono riconosciuti dagli automi $N_1$ e $N_2$. Poiché la classe dei linguaggi regolari è [[Finite Automaton#Chiusura rispetto all'unione|chiusa rispetto all'unione]], è possibile costruire un NFA $N$ che riconosce $L(N_1) \cup L(N_2)$ mediante l'aggiunta di un nuovo stato iniziale e $\varepsilon$-archi verso gli stati iniziali $N_1$ e $N_2$. Ne consegue che $L(N) = L(R_1) \cup L(R_2) = L(R)$.
- Se $R = R_1 \circ R_2$: dalla definizione si ha $L(R) = L(R_1) \circ L(R_2)$. Per ipotesi induttiva, $L(R_1)$ e $L(R_2)$ sono riconosciuti dagli automi $N_1$ e $N_2$. Poiché la classe dei linguaggi regolari è [[Finite Automaton#Chiusura rispetto alla concatenazione|chiusa rispetto alla concatenazione]], è possibile costruire un NFA $N$ che riconosce $L(N_1) \circ L(N_2)$ collegando tutti gli stati finali di $N_1$ allo stato iniziale di $N_2$ tramite $\varepsilon$-archi. Ne consegue che $L(N) = L(R_1) \circ L(R_2) = L(R)$.
- Se $R = R_1^*$: dalla definizione si ha $L(R) = L(R_1)^*$. Per ipotesi induttiva, $L(R_1)$ e $L(R_2)$ sono riconosciuti dagli automi $N_1$ e $N_2$. Poiché la classe dei linguaggi regolari è [[Finite Automaton#Chiusura rispetto all'operazione star|chiusa rispetto all'operazione star]], è possibile costruire un NFA $N$ che riconosce $L(N_1)^*$ aggiungendo un nuovo stato accettante, un $\varepsilon$-arco da questo al vecchio stato iniziale, e $\varepsilon$-archi che riportano dagli stati di accettazione di $N_1$ al suo stato iniziale. Ne consegue che $L(N) = L(R_1)^* = L(R)$.

---

> [!example] 
> Trasformiamo l'espressione regolare $(\text{ab} \cup \text{a})^*$ in un NFA, partendo dalle sottoespressioni più piccole a quelle più grandi.

![[(ab U a)* example.png]]
![[(ab U a)* example 1.png]]
![[(ab U a)* example 2.png]]

Il primo lemma è dimostrato. Ora veniamo all'altra direzione:

> [!quote] Lemma
> Se un linguaggio $A$ è regolare (ossia esiste un NFA $N$ tale che $L(N) = A$), allora $A$ è descritto da un'espressione regolare $R \in \text{re}(\Sigma)$ (ovvero $A = L(R)$).

Poiché $A$ è un linguaggio regolare, esiste un NFA $N$ tale che $L(N)=A$. Come visto nella sezione [[Regular Expressions#DA NFA A ESPRESSIONE REGOLARE|precedente]], trasformiamo dapprima $N$ in un GNFA equivalente e applichiamo quindi ricorsivamente la procedura CONVERT. Poiché la trasformazione da NFA a GNFA preserva il linguaggio riconosciuto (equivalenza), è sufficiente dimostrare che CONVERT restituisca sempre un'espressione regolare equivalente al GNFA di partenza. Procediamo quindi per induzione sul numero di stati del GNFA.

Caso base:

Sia $k=2$, dove $k$ è il numero di stati del GNFA. In questo caso il GNFA è costituito solamente dallo stato iniziale $q_{\text{start}}$, dallo stato accettante $q_{\text{accept}}$ e dall'unico arco che li collega, etichettato con un'espressione regolare $R$. Per definizione della procedura CONVERT, viene restituita direttamente l'espressione regolare $R$. Poiché tutte e sole le stringhe accettate dal GNFA sono descritte da tale etichetta, possiamo concludere che $L(R)=L(G)$.

Passo induttivo:

Ipotesi induttiva: assumiamo che la proprietà valga per tutti i GNFA con $k-1$ stati, ossia che la procedura CONVERT restituisca un'espressione regolare equivalente al GNFA considerato. Mostriamo che la proprietà vale anche per un GNFA $G$ con $k$ stati. La procedura CONVERT sceglie arbitrariamente uno stato $q_{\text{rip}}\neq q_{\text{start}},q_{\text{accept}}$, ottenendo un nuovo GNFA $G'$ con $k-1$ stati. Per costruzione della procedura CONVERT, $G'$ riconosce lo stesso linguaggio del GNFA originario, ovvero $L(G')=L(G)$. Poiché $G'$ possiede $k-1$ stati, per ipotesi induttiva la procedura CONVERT restituisce un'espressione regolare $R$ tale che $L(R)=L(G')$. Essendo $L(G')=L(G)$, segue che $L(R)=L(G)$.  

Abbiamo quindi dimostrato che la procedura CONVERT restituisce un'espressione regolare equivalente al GNFA di partenza. In conclusione: poiché il GNFA $G$ è stato costruito a partire dall'NFA iniziale $N$ mantenendo invariato il linguaggio riconosciuto, allora: $L(R)=L(G)=L(N)=A$. Il linguaggio regolare $A$ è descritto da un'espressione regolare, cioè $A=L(R)$.

---

