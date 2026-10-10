Per parlare di automi introduciamo prima il concetto di **diagramma di stato**, ovvero un **[[Graphs#GRAFI ORIENTATI|grafo orientato]] ed etichettato** in cui le strutture matematiche del grafo assumono un significato semantico ben preciso per modellare il comportamento di un sistema. I nodi rappresentano gli stati del sistema, gli archi rappresentano le transizioni tra i vari stati e le etichette degli archi rappresentano gli input che scatenano le transizioni.

![[state diagram.png]]

> [!example] 
> Fornendo la stringa di input $\large 1101$ alla macchina in figura l'elaborazione procede transitando nei vari stati come segue:
> 1. Inizia nello stato $\large q_{1}$
> 2. Legge $\large 1$, effettua la transizione da  $\large q_{1}$ a  $\large q_{2}$
> 3. Legge $\large 1$, effettua la transizione da  $\large q_{2}$ a  $\large q_{2}$
> 4. Legge $\large 0$, effettua la transizione da  $\large q_{2}$ a  $\large q_{3}$
> 5. Legge $\large 1$, effettua la transizione da  $\large q_{3}$ a  $\large q_{2}$
> 6. Accetta perché la macchina è nello stato accettante  $\large q_{2}$ alla fine dell'input

Formalizzando questo concetto grafico, si introduce la teoria degli **automi a stati finiti** (deterministici e non). Un **automa** è infatti un modello matematico computazionale astratto che idealizza proprio il comportamento descritto dal diagramma di stato.

---
### AUTOMA DETERMINISTICO

Un automa si definisce **deterministico** se, per ogni configurazione corrente (stato attuale) e per ogni simbolo letto dall'input, esiste **una e una sola transizione possibile** verso lo stato successivo. Volendo dare una definizione formale: 

---
#### Definizione formale di DFA

un **Automa Deterministico a Stati Finiti**, in inglese **Deterministic Finite Automaton (DFA)**, è una quintupla $(\large Q, \Sigma, \delta, q_{0}, F)$ dove:

- $\large Q$ è l'**insieme finito degli stati** dell'automa,
- $\large \Sigma$ è l'**[[Strings|alfabeto]]** dell'automa,
- $\large \delta : Q \times \Sigma \to Q$ è la **funzione di transizione degli stati** dell'automa,
- $\large q_{0} \in Q$ è lo **stato iniziale** dell'automa,
- $\large F \subseteq Q$ è l'insieme degli **stati accettanti** dell'automa. 

Consideriamo nuovamente la macchina descritta sopra, che da adesso possiamo chiamare DFA $\large D_{1}$ in quanto rispetta la definizione.

![[state diagram.png]]

Infatti possiamo descrivere $\large D_{1}$ formalmente ponendo $\large D_{1} = (Q, \Sigma, \delta, q_{0}, F)$, dove:

- $\large Q = \{q_{1}, q_{2}, q_{3}\}$,
- $\large \Sigma = \{0,1\}$,
- $\large \delta$ è descritta come segue: 
$$
\begin{array}{c|cc}
\text{} & \text{0} & \text{1} \\
\hline
q_1 & q_1 & q_2 \\
q_2 & q_3 & q_2 \\
q_3 & q_2 & q_2 \\
\end{array}
$$

- $\large q_{1}$ è lo **stato iniziale** dell'automa,
- $\large F = \{q_{2}\}$ è l'insieme degli **stati accettanti**. 

---
#### Configurazione

Per descrivere la situazione di un automa a un preciso istante durante la lettura di un input, usiamo la **configurazione**. Una configurazione è una coppia $\large (q,x) \in Q \times \Sigma^*$, dove $\large q \in Q$ rappresenta lo stato attuale in cui si trova l'automa e $\large x \in \Sigma^*$ rappresenta la parte rimanente della stringa che l'automa deve ancora leggere. 

> [!example] 
> La configurazione iniziale del DFA $\large D_1$ (figura sopra) se la stringa da elaborare e $\large w$ è $\large (q_1,w)$, in quanto $\large q_1$ è lo stato iniziale.

---
#### Linguaggio di un DFA

Se $\large A$ è l'insieme di tutte le stringhe che la accettate da un DFA $\large M$, diciamo che $\large A$ è il **[[Strings#LINGUAGGI|linguaggio]] della macchina** $\large M$ e scriviamo $\large L(M) = A$. Diciamo che $\large M$ **riconosce** $\large A$. Una macchina **riconosce sempre e soltanto un linguaggio**.

> [!example] 
> Considerando nuovamente il DFA $\large D_{1}$ possiamo quindi dire: $\large A = \{w\ |\ w\  \text{contiene almeno un 1 e un numero pari di 0 segue l'ultimo 1}\}$ allora  $\large L(D_{1}) = A$, o equivalentemente,  $\large D_{1}$ riconosce $\large A$.

---
##### Funzione di transizione estesa

Adesso vogliamo dare la definizione formale di **linguaggio riconosciuto** $\large L(\text{DFA})$. Per farlo utilizziamo la **funzione di transizione estesa** $\large \delta^* : Q \times \Sigma^* \to Q$ definita ricorsivamente:

$$
\large
\begin{cases} 
\delta^*(q,\varepsilon) = \delta(q,\varepsilon) = q \\ 
\delta^*(q,ax) = \delta^*(\delta(q,a),x)\quad\text{\normalsize dove}\ a \in \Sigma\ \text{\normalsize e}\ x \in \Sigma^*
\end{cases}
$$

L'input di $\large \delta^*$ è lo stato iniziale/corrente del DFA $\large q \in Q$ e un'intera stringa $\large w = ax \in \Sigma^*$ (non un singolo carattere come per $\large\delta$), invece l'output è lo **stato finale** in cui si troverà l'automa dopo aver letto tutti i caratteri della stringa $\large w$ uno alla volta da sinistra a destra.

- **Caso base:** $\large\delta^*(q,\varepsilon) = \delta(q,\varepsilon) = q$. Se l'automa non legge alcun carattere (stringa vuota $\large\varepsilon$), rimane nello stato in cui si trova.
- **Passo ricorsivo:** $\large\delta^*(q,ax) = \delta^*(\delta(q,a),x)$. Per elaborare la stringa $\large ax$ si calcola prima $\large\delta(q,a)$, cioè lo stato raggiunto leggendo il primo carattere $\large a$, poi si applica in modo ricorsivo $\large \delta^*$ a partire dal nuovo stato ottenuto e con la parte restante della stringa $\large x$.

> [!example] 
> Per calcolare $\large\delta^*(q_0, w)$ con $\large w = 101$: 
> sappiamo che $\large a = 1$ e $\large x = 01$, dunque $\large\delta^*(q_0,101) = \delta^*(\delta(q_0,1),01)$. 
> Se $\large \delta(q_0,1) = q_1$ allora diventa  $\large\delta^*(q_1,01) = \delta^*(\delta(q_1,0),1)$ con  $\large a = 0$ e $\large x = 1$. 
> Allo stesso modo, se $\large \delta(q_1,0) = q_2$ allora diventa  $\large\delta^*(q_2,1) = \delta^*(\delta(q_2,1),\varepsilon)$ con  $\large a = 1$ e $\large x = \varepsilon$ in quanto la stringa è terminata.
> Infine, se $\large \delta(q_2,1) = q_3$ allora diventa $\large\delta^*(q_3,\varepsilon) = q_3$, siamo arrivati al caso base e possiamo dire che $\large\delta^*(q_0, 101) = q_3$.

---
##### Definizione formale del linguaggio riconosciuto

Grazie alla funzione $\large\delta^*$, possiamo quindi definire formalmente il linguaggio $\large L$ riconosciuto da un DFA $\large M = (Q, \Sigma, \delta, q_{0}, F)$, ovvero: $\large L(M) = \{w \in \Sigma^*: \delta^*(q_0,w)\in F\}$. Quindi, una stringa $\large w$ appartiene al linguaggio $\large L(M)$ del DFA se e solo se, partendo dallo stato iniziale $\large q_0$ ed elaborando tutta la stringa $\large w$, l'automa si ferma in uno degli stati finali $\large F$.

> [!example] 
> Riprendiamo il DFA $\large D_1$ e verifichiamo che la stringa $\large w = 100$ appartenga al linguaggio $\large L(D_1)$. Secondo la definizione ci occorre quindi calcolare che $\large\delta^*(q_1, w) \in F$.
> Allo start: $\large\delta^*(q_1,100) = \delta^*(\delta(q_1,1),00)$ con  $\large a = 1$ e $\large x = 00$. 
> Poi: $\large \delta(q_1,1) = q_2$ quindi diventa $\large\delta^*(q_2,00) = \delta^*(\delta(q_2,0),0)$ con  $\large a = 0$ e $\large x = 0$. 
> Poi: $\large \delta(q_2,0) = q_3$ quindi diventa  $\large\delta^*(q_3,0) = \delta^*(\delta(q_3,0),\varepsilon)$ con  $\large a = 0$ e $\large x = \varepsilon$.
> Infine: $\large \delta(q_3,0) = q_2$ quindi diventa $\large\delta^*(q_2,\varepsilon) = q_2$, siamo arrivati al caso base e possiamo dire che $\large\delta^*(q_1, 100) = q_2$ con $\large q_2 \in F$ dunque $\large w \in L(D_1)$.

---
##### Linguaggi Regolari

La classe dei **linguaggi regolari** ($\large \text{REG}$) è l'insieme di tutti i linguaggi accettati da un DFA: $\large \text{REG} = \{ L \subseteq \Sigma^* : \exists \text{ un DFA } M \text{ tale che } L(M) = L \}$.

![[regular languages example.png]]

> [!example]
> Considerando il linguaggio delle stringhe binari che iniziano con il simbolo $\large 1$:
> 
> $$
> \large L = \{ x \in \{0, 1\}^* : x = 1y, \text{ con } y \in \{0, 1\}^* \}
> $$
> 
> Il DFA in grado di riconoscere tale linguaggio è quello in figura. Lo stato $\large q_1$ è detto stato pozzo o trap state: un particolare stato non accettante dal quale è impossibile uscire).
> 

---

#### Relazione di transizione nei DFA

La funzione $\large\delta$ permette di definire formalmente i passaggi di stato di un automa $\large M$ attraverso la relazione di transizione tra configurazioni: $\large(p, ax) \vdash_M (q, x) \iff \delta(p, a) = q$ con $\large a \in \Sigma$,  $\large x \in \Sigma^*$ e $\large p, q \in Q$. Per descrivere sequenze arbitrarie di mosse si considera la **chiusura riflessiva e transitiva** della relazione, indicata con $\vdash_M^*$:

  - **Riflessività:** $\large (q, x) \vdash_M^* (q, x)$ per ogni $\large q \in Q$ e $\large x \in \Sigma^*$ (l'automa non modifica il proprio stato se non legge alcun simbolo dall'input).
  - **Transitività:** Se $\large(q, aby) \vdash_M (p, by)$ e $\large (p, by) \vdash_M (r, y)$ con $\large a, b \in \Sigma$ e $\large y \in \Sigma^*$, allora $\large (q, aby) \vdash_M^* (r, y)$.

![[transition relation.png]]

> [!example]
> Dato il DFA in figura con stato iniziale $\large q_1$, stato finale $\large q_2$ e transizioni tra i due stati tali che: $\large \delta(q_1, 0) = q_1$, $\large \delta(q_1, 1) = q_2$, $\large \delta(q_2, 1) = q_2$ e $\large \delta(q_2, 0) = q_1$, allora possiamo scrivere che $\large (q_1, 011) \vdash_M (q_1, 11) \vdash_M (q_2, 1) \vdash_M (q_2, \varepsilon) \implies (q_1, 011) \vdash_M^* (q_2, \varepsilon)$.

---
##### Condizione di Accettazione nei DFA

Dopo aver definito la relazione di transizione, possiamo ridefinire in modo compatto la condizione di accettazione di una stringa $\large x \in \Sigma^*$ da parte di un automa. Un automa $\large M$ **accetta** una stringa $\large x \in \Sigma^*$ se e solo se $\large (q_0, x) \vdash_M^* (q, \varepsilon)$ con $\large q \in F$.

> [!tip]
> Questa formulazione basata sulle configurazioni è del tutto equivalente a quella definita tramite la funzione di [[Automaton#Definizione formale del linguaggio riconosciuto|transizione estesa]] $\large\delta^*$:
>
> $$
> \large x \in L(M) \iff (q_0, x) \vdash_M^* (q, \varepsilon) \text{ con } q \in F \iff \delta^*(q_0, x) \in F
> $$
>
> In altre parole, la relazione $\large \vdash_M^*$ descrive l'**evoluzione dinamica** (passo-passo) della configurazione dell'automa durante la lettura dell'input, mentre $\large \delta^*(q_0, x)$ ne definisce il **risultato finale** (lo stato di arrivo).

---
### AUTOMA NON DETERMINISTICO

Un automa si definisce **non deterministico** se, a parità di configurazione e di simbolo letto in input, il sistema può ammettere **zero, una o più transizioni possibili** verso stati successivi diversi.  Il sistema può idealmente ramificarsi ed esplorare più percorsi di calcolo in parallelo. Una stringa viene accettata se **almeno uno** dei cammini possibili porta a uno stato finale di accettazione. 

![[deterministic non-deterministic.png]]

La figura seguente mostra un esempio di automa finito non deterministico, notiamo subito alcune differenze con un automa deterministico. In primo luogo, ogni stato di un DFA ha sempre esattamente un arco uscente per ogni simbolo dell'alfabeto. In questo caso invece:

- lo stato $\large q_1$ ha un arco uscente per $\large 0$ ma ne ha due per $\large 1$,
- lo stato $\large q_2$ ha un arco uscente per $\large 0$ ma nessuno per $\large 1$,
- lo stato $\large q_3$ ha un arco uscente per $\large 1$ ma nessuno per $\large 0$.

Ad ogni stato la macchina si divide in più copie di se stessa e segue tutte le possibilità in parallelo. Se nello stato corrente ci sono scelte successive la macchina si divide di nuovo. Se invece il simbolo di input successivo non compare su alcuno degli archi uscenti dallo stato occupato dalla copia della macchina, quella copia della macchina muore, insieme con il ramo della computazione a essa associato. Infine, se una qualsiasi di queste copie della macchina è in uno stato accettante alla fine dell'input, l'automa accetta la stringa di input.

![[nfa example.png]]

Inoltre, in un DFA, le etichette sugli archi di transizione ammettono solo simboli dell'alfabeto. Nell'esempio riportato invece troviamo anche un arco etichettato con $\large \varepsilon$ (chiamato $\large \varepsilon$-arco), che indica una transizione spontanea: se ci imbattiamo nello stato $\large q_2$, contemporaneamente, senza leggere alcun input, la macchina si divide in più copie multiple: una che segue ciascun $\large \varepsilon$-arco, in questo caso quella diretta in $\large q_3$, e una che resta nello stato corrente. 

![[nfa tree example.png]]


> [!example] 
> Esempio di computazione dell'NFA mostrato sopra sull'input $\large 010110$.

---
#### Definizione formale di NFA

Un **Automa Non Deterministico a Stati Finiti**, in inglese **Non-deterministic Finite Automaton (NFA)**, è una quintupla $(\large Q, \Sigma, \delta, q_{0}, F)$ dove:

- $\large Q$ è l'**insieme finito degli stati** dell'automa,
- $\large \Sigma$ è l'**[[Strings|alfabeto]]** dell'automa,
- $\large \delta : Q \times \Sigma_\varepsilon \to \mathcal{P}(Q)$ è la **funzione di transizione degli stati** dell'automa,
- $\large q_{0} \in Q$ è lo **stato iniziale** dell'automa,
- $\large F \subseteq Q$ è l'insieme degli **stati accettanti** dell'automa. 

> [!important]
> Nota come dalla [[Automaton#Definizione formale di DFA|definizione di DFA]] cambi solamente la struttura della funzione di transizione degli stati che va da $\large Q\times \Sigma_\varepsilon$, dove $\large  \Sigma_\varepsilon = \Sigma \cup \{\varepsilon\}$, a $\large \mathcal{P}(Q)$, ovvero l'**insieme delle parti** (o insieme potenza) di $\large Q$, la collezione di tutti i possibili sottoinsiemi di $\large Q$.

Consideriamo nuovamente l'automa descritto sopra, che da adesso possiamo confermare essere un NFA in quanto rispetta la definizione, e chiamiamolo  $\large N_{1}$.

![[nfa example.png]]

Infatti possiamo descrivere $\large N_{1}$ formalmente ponendo $\large N_{1} = (Q, \Sigma, \delta, q_{0}, F)$, dove:

- $\large Q = \{q_{1}, q_{2}, q_{3}, q_{4}\}$,
- $\large \Sigma = \{0,1\}$,
- $\large \delta$ è descritta come segue: 
$$
\begin{array}{c|ccc}
\text{} & \text{0} & \text{1} & \varepsilon \\
\hline
q_1 & \{q_1\} & \{q_1,q_2\} & \emptyset \\
q_2 & \{q_3\} & \emptyset & \{q_3\} \\
q_3 & \emptyset & \{q_4\} & \emptyset \\
q_4 & \{q_4\} & \{q_4\} & \emptyset \\
\end{array}
$$

- $\large q_{1}$ è lo **stato iniziale** dell'automa,
- $\large F = \{q_{4}\}$ è l'insieme degli **stati accettanti**. 

---
#### Relazione di transizione negli NFA

La funzione di transizione $\large\delta: Q \times \Sigma_\varepsilon \to \mathcal{P}(Q)$ di un NFA estende il concetto di passaggio di stato attraverso la relazione di transizione tra configurazioni: $\large(p, ax) \vdash_N (q, x) \iff q \in \delta(p, a)$ dove $\large p, q \in Q$, $\large a \in \Sigma_\varepsilon$, $\large x \in \Sigma^*$. A differenza dei DFA, dove ogni mossa porta a un singolo stato ben preciso, negli NFA la funzione $\large\delta$ restituisce un **insieme di stati** appartenente a $\large\mathcal{P}(Q)$: lo stato successivo $\large q$ è quindi solo una tra le varie opzioni possibili in $\large\delta(p, a)$. Inoltre, gli NFA ammettono le $\large\varepsilon$-transizioni ($\large a \in \Sigma_\varepsilon = \Sigma \cup \{\varepsilon\}$), consentendo all'automa di cambiare stato senza consumare alcun simbolo dell'input ($\large (p, \varepsilon x) \vdash_N (q, x)$), cosa invece non permessa nei DFA standard. Estendiamo la relazione $\large\vdash_N$ per riflessività e transitività nella relazione estesa $\large\vdash_N^*$:

- **Riflessività:** $\large (q, x) \vdash_N^* (q, x)$ per ogni $\large q \in Q$ e $\large x \in \Sigma^*$.    
- **Transitività:** Se $\large(p, ax) \vdash_N (q, x)$ e $\large (q, x) \vdash_N^* (r, \varepsilon)$, allora $\large (p, ax) \vdash_N^* (r, \varepsilon)$.

---
##### Condizione di Accettazione negli NFA

Attraverso la relazione di transizione estesa $\large\vdash_N^*$, possiamo definire in modo formale e compatto la condizione di accettazione per un NFA $\large N$: un NFA $\large N$ accetta una stringa $\large w \in \Sigma^*$ se e solo se esiste almeno un cammino computazionale che porta ad uno stato finale di accettazione: $\large N$ accetta $\large w$ $\large \iff \exists\ q \in F : (q_0, w) \vdash_N^* (q, \varepsilon)$

> [!tip]
> Questa formulazione basata sulle configurazioni rappresenta il modo formale per esprimere il concetto di **non-determinismo**: mentre in un DFA il cammino di esecuzione per una stringa $\large w$ è unico, in un NFA vi possono essere molteplici cammini paralleli o vicoli ciechi. È sufficiente che **almeno un cammino** termini in uno stato $\large q \in F$ consumando l'intera stringa per far sì che $\large w$ appartenga al linguaggio $\large L(N)$.

---

