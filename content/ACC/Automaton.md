Per parlare di automi introduciamo prima il concetto di **diagramma di stato**, ovvero un **[[Graphs#GRAFI ORIENTATI|grafo orientato]] ed etichettato** in cui le strutture matematiche del grafo assumono un significato semantico ben preciso per modellare il comportamento di un sistema. I nodi rappresentano gli stati del sistema, gli archi rappresentano le transizioni tra i vari stati e le etichette degli archi rappresentano gli input che scatenano le transizioni.

![[state diagram.png]]

> [!example] 
> Fornendo la stringa di input $1101$ alla macchina in figura l'elaborazione procede transitando nei vari stati come segue:
> 1. Inizia nello stato $q_{1}$
> 2. Legge $1$, effettua la transizione da  $q_{1}$ a  $q_{2}$
> 3. Legge $1$, effettua la transizione da  $q_{2}$ a  $q_{2}$
> 4. Legge $0$, effettua la transizione da  $q_{2}$ a  $q_{3}$
> 5. Legge $1$, effettua la transizione da  $q_{3}$ a  $q_{2}$
> 6. Accetta perché la macchina è nello stato accettante  $q_{2}$ alla fine dell'input

Formalizzando questo concetto grafico, si introduce la teoria degli **automi a stati finiti** (deterministici e non). Un **automa** è infatti un modello matematico computazionale astratto che idealizza proprio il comportamento descritto dal diagramma di stato.

---
### AUTOMA DETERMINISTICO

Un automa si definisce **deterministico** se, per ogni configurazione corrente (stato attuale) e per ogni simbolo letto dall'input, esiste **una e una sola transizione possibile** verso lo stato successivo. Volendo dare una definizione formale: 

---
#### Definizione formale di DFA

un **Automa Deterministico a Stati Finiti**, in inglese **Deterministic Finite Automaton (DFA)**, è una quintupla $(Q, \Sigma, \delta, q_{0}, F)$ dove:

- $Q$ è l'**insieme finito degli stati** dell'automa,
- $\Sigma$ è l'**[[Strings|alfabeto]]** dell'automa,
- $\delta : Q \times \Sigma \to Q$ è la **funzione di transizione degli stati** dell'automa,
- $q_{0} \in Q$ è lo **stato iniziale** dell'automa,
- $F \subseteq Q$ è l'insieme degli **stati accettanti** dell'automa. 

Consideriamo nuovamente la macchina descritta sopra, che da adesso possiamo chiamare DFA $D_{1}$ in quanto rispetta la definizione.

![[state diagram.png]]

Infatti possiamo descrivere $D_{1}$ formalmente ponendo $D_{1} = (Q, \Sigma, \delta, q_{0}, F)$, dove:

- $Q = \{q_{1}, q_{2}, q_{3}\}$,
- $\Sigma = \{0,1\}$,
- $\delta$ è descritta come segue: 
$$
\begin{array}{c|cc}
\text{} & \text{0} & \text{1} \\
\hline
q_1 & q_1 & q_2 \\
q_2 & q_3 & q_2 \\
q_3 & q_2 & q_2 \\
\end{array}
$$

- $q_{1}$ è lo **stato iniziale** dell'automa,
- $F = \{q_{2}\}$ è l'insieme degli **stati accettanti**. 

---
#### Configurazione

Per descrivere la situazione di un automa a un preciso istante durante la lettura di un input, usiamo la **configurazione**. Una configurazione è una coppia $(q,x) \in Q \times \Sigma^*$, dove $q \in Q$ rappresenta lo stato attuale in cui si trova l'automa e $x \in \Sigma^*$ rappresenta la parte rimanente della stringa che l'automa deve ancora leggere. 

> [!example] 
> La configurazione iniziale del DFA $D_1$ (figura sopra) se la stringa da elaborare e $w$ è $(q_1,w)$, in quanto $q_1$ è lo stato iniziale.

---
#### Linguaggio di un DFA

Se $A$ è l'insieme di tutte le stringhe che la accettate da un DFA $M$, diciamo che $A$ è il **[[Strings#LINGUAGGI|linguaggio]] della macchina** $M$ e scriviamo $L(M) = A$. Diciamo che $M$ **riconosce** $A$. Una macchina **riconosce sempre e soltanto un linguaggio**.

> [!example] 
> Considerando nuovamente il DFA $D_{1}$ possiamo quindi dire: $A = \{w\ |\ w\  \text{contiene almeno un 1 e un numero pari di 0 segue l'ultimo 1}\}$ allora  $L(D_{1}) = A$, o equivalentemente,  $D_{1}$ riconosce $A$.

---
##### Funzione di transizione estesa

Adesso vogliamo dare la definizione formale di **linguaggio riconosciuto** $L(\text{DFA})$. Per farlo utilizziamo la **funzione di transizione estesa** $\delta^* : Q \times \Sigma^* \to Q$ definita ricorsivamente:

$$

\begin{cases} 
\delta^*(q,\varepsilon) = \delta(q,\varepsilon) = q \\ 
\delta^*(q,ax) = \delta^*(\delta(q,a),x)\quad\text{\normalsize dove}\ a \in \Sigma\ \text{\normalsize e}\ x \in \Sigma^*
\end{cases}
$$

L'input di $\delta^*$ è lo stato iniziale/corrente del DFA $q \in Q$ e un'intera stringa $w = ax \in \Sigma^*$ (non un singolo carattere come per $\delta$), invece l'output è lo **stato finale** in cui si troverà l'automa dopo aver letto tutti i caratteri della stringa $w$ uno alla volta da sinistra a destra.

- **Caso base:** $\delta^*(q,\varepsilon) = \delta(q,\varepsilon) = q$. Se l'automa non legge alcun carattere (stringa vuota $\varepsilon$), rimane nello stato in cui si trova.
- **Passo ricorsivo:** $\delta^*(q,ax) = \delta^*(\delta(q,a),x)$. Per elaborare la stringa $ax$ si calcola prima $\delta(q,a)$, cioè lo stato raggiunto leggendo il primo carattere $a$, poi si applica in modo ricorsivo $\delta^*$ a partire dal nuovo stato ottenuto e con la parte restante della stringa $x$.

> [!example] 
> Per calcolare $\delta^*(q_0, w)$ con $w = 101$: 
> sappiamo che $a = 1$ e $x = 01$, dunque $\delta^*(q_0,101) = \delta^*(\delta(q_0,1),01)$. 
> Se $\delta(q_0,1) = q_1$ allora diventa  $\delta^*(q_1,01) = \delta^*(\delta(q_1,0),1)$ con  $a = 0$ e $x = 1$. 
> Allo stesso modo, se $\delta(q_1,0) = q_2$ allora diventa  $\delta^*(q_2,1) = \delta^*(\delta(q_2,1),\varepsilon)$ con  $a = 1$ e $x = \varepsilon$ in quanto la stringa è terminata.
> Infine, se $\delta(q_2,1) = q_3$ allora diventa $\delta^*(q_3,\varepsilon) = q_3$, siamo arrivati al caso base e possiamo dire che $\delta^*(q_0, 101) = q_3$.

---
##### Definizione formale del linguaggio riconosciuto

Grazie alla funzione $\delta^*$, possiamo quindi definire formalmente il linguaggio $L$ riconosciuto da un DFA $M = (Q, \Sigma, \delta, q_{0}, F)$, ovvero: $L(M) = \{w \in \Sigma^*: \delta^*(q_0,w)\in F\}$. Quindi, una stringa $w$ appartiene al linguaggio $L(M)$ del DFA se e solo se, partendo dallo stato iniziale $q_0$ ed elaborando tutta la stringa $w$, l'automa si ferma in uno degli stati finali $F$.

> [!example] 
> Riprendiamo il DFA $D_1$ e verifichiamo che la stringa $w = 100$ appartenga al linguaggio $L(D_1)$. Secondo la definizione ci occorre quindi calcolare che $\delta^*(q_1, w) \in F$.
> Allo start: $\delta^*(q_1,100) = \delta^*(\delta(q_1,1),00)$ con  $a = 1$ e $x = 00$. 
> Poi: $\delta(q_1,1) = q_2$ quindi diventa $\delta^*(q_2,00) = \delta^*(\delta(q_2,0),0)$ con  $a = 0$ e $x = 0$. 
> Poi: $\delta(q_2,0) = q_3$ quindi diventa  $\delta^*(q_3,0) = \delta^*(\delta(q_3,0),\varepsilon)$ con  $a = 0$ e $x = \varepsilon$.
> Infine: $\delta(q_3,0) = q_2$ quindi diventa $\delta^*(q_2,\varepsilon) = q_2$, siamo arrivati al caso base e possiamo dire che $\delta^*(q_1, 100) = q_2$ con $q_2 \in F$ dunque $w \in L(D_1)$.

---
#### Relazione di transizione nei DFA

La funzione $\delta$ permette di definire formalmente i passaggi di stato di un automa $M$ attraverso la relazione di transizione tra configurazioni: $(p, ax) \vdash_M (q, x) \iff \delta(p, a) = q$ con $a \in \Sigma$,  $x \in \Sigma^*$ e $p, q \in Q$. Per descrivere sequenze arbitrarie di mosse si considera la **chiusura riflessiva e transitiva** della relazione, indicata con $\vdash_M^*$:

  - **Riflessività:** $(q, x) \vdash_M^* (q, x)$ per ogni $q \in Q$ e $x \in \Sigma^*$ (l'automa non modifica il proprio stato se non legge alcun simbolo dall'input).
  - **Transitività:** Se $(q, aby) \vdash_M (p, by)$ e $(p, by) \vdash_M (r, y)$ con $a, b \in \Sigma$ e $y \in \Sigma^*$, allora $(q, aby) \vdash_M^* (r, y)$.

![[transition relation.png]]

> [!example]
> Dato il DFA in figura con stato iniziale $q_1$, stato finale $q_2$ e transizioni tra i due stati tali che: $\delta(q_1, 0) = q_1$, $\delta(q_1, 1) = q_2$, $\delta(q_2, 1) = q_2$ e $\delta(q_2, 0) = q_1$, allora possiamo scrivere che $(q_1, 011) \vdash_M (q_1, 11) \vdash_M (q_2, 1) \vdash_M (q_2, \varepsilon) \implies (q_1, 011) \vdash_M^* (q_2, \varepsilon)$.

---
##### Condizione di Accettazione nei DFA

Dopo aver definito la relazione di transizione, possiamo ridefinire in modo compatto la condizione di accettazione di una stringa $x \in \Sigma^*$ da parte di un automa. Un automa $M$ **accetta** una stringa $x \in \Sigma^*$ se e solo se $(q_0, x) \vdash_M^* (q, \varepsilon)$ con $q \in F$.

> [!tip]
> Questa formulazione basata sulle configurazioni è del tutto equivalente a quella definita tramite la funzione di [[Automaton#Definizione formale del linguaggio riconosciuto|transizione estesa]] $\delta^*$:
>
> $$
> x \in L(M) \iff (q_0, x) \vdash_M^* (q, \varepsilon) \text{ con } q \in F \iff \delta^*(q_0, x) \in F
> $$
>
> In altre parole, la relazione $\vdash_M^*$ descrive l'**evoluzione dinamica** (passo-passo) della configurazione dell'automa durante la lettura dell'input, mentre $\delta^*(q_0, x)$ ne definisce il **risultato finale** (lo stato di arrivo).

---
### AUTOMA NON DETERMINISTICO

Un automa si definisce **non deterministico** se, a parità di configurazione e di simbolo letto in input, il sistema può ammettere **zero, una o più transizioni possibili** verso stati successivi diversi.  Il sistema può idealmente ramificarsi ed esplorare più percorsi di calcolo in parallelo. Una stringa viene accettata se **almeno uno** dei cammini possibili porta a uno stato finale di accettazione. 

![[deterministic non-deterministic.png]]

La figura seguente mostra un esempio di automa finito non deterministico, notiamo subito alcune differenze con un automa deterministico. In primo luogo, ogni stato di un DFA ha sempre esattamente un arco uscente per ogni simbolo dell'alfabeto. In questo caso invece:

- lo stato $q_1$ ha un arco uscente per $0$ ma ne ha due per $1$,
- lo stato $q_2$ ha un arco uscente per $0$ ma nessuno per $1$,
- lo stato $q_3$ ha un arco uscente per $1$ ma nessuno per $0$.

Ad ogni stato la macchina si divide in più copie di se stessa e segue tutte le possibilità in parallelo. Se nello stato corrente ci sono scelte successive la macchina si divide di nuovo. Se invece il simbolo di input successivo non compare su alcuno degli archi uscenti dallo stato occupato dalla copia della macchina, quella copia della macchina muore, insieme con il ramo della computazione a essa associato. Infine, se una qualsiasi di queste copie della macchina è in uno stato accettante alla fine dell'input, l'automa accetta la stringa di input.

![[nfa example.png]]

Inoltre, in un DFA, le etichette sugli archi di transizione ammettono solo simboli dell'alfabeto. Nell'esempio riportato invece troviamo anche un arco etichettato con $\varepsilon$ (chiamato $\varepsilon$-arco), che indica una transizione spontanea: se ci imbattiamo nello stato $q_2$, contemporaneamente, senza leggere alcun input, la macchina si divide in più copie multiple: una che segue ciascun $\varepsilon$-arco, in questo caso quella diretta in $q_3$, e una che resta nello stato corrente. 

![[nfa tree example.png]]


> [!example] 
> Esempio di computazione dell'NFA mostrato sopra sull'input $010110$.

---
#### Definizione formale di NFA

Un **Automa Non Deterministico a Stati Finiti**, in inglese **Non-deterministic Finite Automaton (NFA)**, è una quintupla $(Q, \Sigma, \delta, q_{0}, F)$ dove:

- $Q$ è l'**insieme finito degli stati** dell'automa,
- $\Sigma$ è l'**[[Strings|alfabeto]]** dell'automa,
- $\delta : Q \times \Sigma_\varepsilon \to \mathcal{P}(Q)$ è la **funzione di transizione degli stati** dell'automa,
- $q_{0} \in Q$ è lo **stato iniziale** dell'automa,
- $F \subseteq Q$ è l'insieme degli **stati accettanti** dell'automa. 

> [!important]
> Nota come dalla [[Automaton#Definizione formale di DFA|definizione di DFA]] cambi solamente la struttura della funzione di transizione degli stati che va da $Q\times \Sigma_\varepsilon$, dove $ \Sigma_\varepsilon = \Sigma \cup \{\varepsilon\}$, a $\mathcal{P}(Q)$, ovvero l'**insieme delle parti** (o insieme potenza) di $Q$, la collezione di tutti i possibili sottoinsiemi di $Q$.

Consideriamo nuovamente l'automa descritto sopra, che da adesso possiamo confermare essere un NFA in quanto rispetta la definizione, e chiamiamolo  $N_{1}$.

![[nfa example.png]]

Infatti possiamo descrivere $N_{1}$ formalmente ponendo $N_{1} = (Q, \Sigma, \delta, q_{0}, F)$, dove:

- $Q = \{q_{1}, q_{2}, q_{3}, q_{4}\}$,
- $\Sigma = \{0,1\}$,
- $\delta$ è descritta come segue: 
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

- $q_{1}$ è lo **stato iniziale** dell'automa,
- $F = \{q_{4}\}$ è l'insieme degli **stati accettanti**. 

---
#### Relazione di transizione negli NFA

La funzione di transizione $\delta: Q \times \Sigma_\varepsilon \to \mathcal{P}(Q)$ di un NFA estende il concetto di passaggio di stato attraverso la relazione di transizione tra configurazioni: $(p, ax) \vdash_N (q, x) \iff q \in \delta(p, a)$ dove $p, q \in Q$, $a \in \Sigma_\varepsilon$, $x \in \Sigma^*$. A differenza dei DFA, dove ogni mossa porta a un singolo stato ben preciso, negli NFA la funzione $\delta$ restituisce un **insieme di stati** appartenente a $\mathcal{P}(Q)$: lo stato successivo $q$ è quindi solo una tra le varie opzioni possibili in $\delta(p, a)$. Inoltre, gli NFA ammettono le $\varepsilon$-transizioni ($a \in \Sigma_\varepsilon = \Sigma \cup \{\varepsilon\}$), consentendo all'automa di cambiare stato senza consumare alcun simbolo dell'input ($(p, \varepsilon x) \vdash_N (q, x)$), cosa invece non permessa nei DFA. Estendiamo la relazione $\vdash_N$ per riflessività e transitività nella relazione estesa $\vdash_N^*$:

- **Riflessività:** $(q, x) \vdash_N^* (q, x)$ per ogni $q \in Q$ e $x \in \Sigma^*$.    
- **Transitività:** Se $(p, ax) \vdash_N (q, x)$ e $(q, x) \vdash_N^* (r, \varepsilon)$, allora $(p, ax) \vdash_N^* (r, \varepsilon)$.

---
##### Condizione di Accettazione negli NFA

Attraverso la relazione di transizione estesa $\vdash_N^*$, possiamo definire in modo formale e compatto la condizione di accettazione per un NFA $N$: un NFA $N$ accetta una stringa $w \in \Sigma^*$ se e solo se esiste almeno un cammino computazionale che porta ad uno stato finale di accettazione: $N$ accetta $w$ $\iff \exists\ q \in F : (q_0, w) \vdash_N^* (q, \varepsilon)$

> [!tip]
> Questa formulazione basata sulle configurazioni rappresenta il modo formale per esprimere il concetto di **non-determinismo**: mentre in un DFA il cammino di esecuzione per una stringa $w$ è unico, in un NFA vi possono essere molteplici cammini paralleli o vicoli ciechi. È sufficiente che **almeno un cammino** termini in uno stato $q \in F$ consumando l'intera stringa per far sì che $w$ appartenga al linguaggio $L(N)$.

---
### EQUIVALENZA TRA NFA E DFA

> [!quote] Theorem
> Per ogni automa finito non deterministico esiste un automa finito deterministico equivalente.

Prima di affrontare la dimostrazione del teorema, definiamo il concetto di equivalenza tra automi. Dato un alfabeto $\Sigma$, possiamo definire la classe dei linguaggi su $\Sigma$ [[Automaton#Definizione formale del linguaggio riconosciuto|riconosciuti]] da un DFA come l'insieme: $\mathcal{L}(\text{DFA}) = \{L \subseteq \Sigma^* \mid \exists \text{ DFA } D : L = L(D)\}$. Analogamente definiamo la classe dei linguaggi riconosciuti da un NFA come: $\mathcal{L}(\text{NFA}) = \{L \subseteq \Sigma^* \mid \exists \text{ NFA } N : L = L(N)\}$. Poiché due macchine si dicono **equivalenti** se riconoscono lo stesso linguaggio, per dimostrare l'equivalenza tra NFA e DFA dobbiamo provare che $\mathcal{L}(\text{DFA}) = \mathcal{L}(\text{NFA})$.

**Dimostrazione:**

Dimostriamo che $\mathcal{L}(\text{DFA}) \subseteq \mathcal{L}(\text{NFA})$:

Questa inclusione è banale perché **ogni DFA è già, per definizione, un NFA valido** (senza $\varepsilon$-transizioni e con transizioni verso un unico stato).

> [!example]
> Se nel DFA la transizione è $\delta(q, a) = p$, nell'NFA puoi semplicemente definirla come $\delta'(q, a) = \{p\}$ (un sottoinsieme con un solo elemento).

Dimostriamo che $\mathcal{L}(\text{NFA}) \subseteq \mathcal{L}(\text{DFA})$:

Sia $N = (Q, \Sigma, \delta, q_{0}, F)$ l'NFA che riconosce un linguaggio $A$, se riusciamo a costruire un DFA $D = (Q', \Sigma', \delta', q_{0}', F')$ che riconosce $A$ (equivalente), allora l'inclusione è dimostrata. Consideriamo inizialmente il caso più semplice in cui $N$ non ha senza $\varepsilon$-archi:

- $Q' = \mathcal{P}(Q)$: ogni stato di $D$ è un insieme di stati di $N$.
- Dati $R \in Q'$ e $a \in \Sigma$, poiché ogni stato di $D$ corrisponde a un insieme di stati di $N$, la transizione $\delta'(R, a)$ individua il nuovo stato di arrivo di $D$ raccogliendo tutte le possibili destinazioni raggiungibili leggendo $a$ da ciascuno stato $r \in R$ in $N$, formalmente definita come $\delta'(R,a) =\displaystyle \bigcup_{r\in R}\delta (r,a) = \{q \in Q : q \in \delta (r,a) \text{ per qualche } r\in R\}$.
- $q_{0}' = \{q_0\}$: senza considerare gli $\varepsilon$-archi lo stato iniziale di $D$ corrisponde alla collezione contenente solo lo stato iniziale di $N$.
- $F' = \{R \in Q' : R \cap F \neq \emptyset\}$: uno stato di $D$ è accettante se contiene almeno uno degli stati accettanti di $N$.  

Ora dobbiamo considerare gli $\varepsilon$-archi. Per farlo introduciamo qualche ulteriore notazione. Per ogni stato $R$ di $D$, definiamo $E(R)$ come la collezione di stati che possono essere raggiunti dagli elementi di $R$ tramite $\varepsilon$-archi, includendo gli stessi elementi di $R$, ovvero: $E(R) = R \cup \{q \in Q:q \text{ può essere raggiunto da } R \text{ per 1 o più } \varepsilon \text{-archi}\}$. Possiamo adesso espandere la funzione di transizione $\delta'$ di $D$ tramite la chiusura $E(R)$: 

$$\delta'(R,a) =\displaystyle \bigcup_{r\in E(R)}E(\delta (r,a)) = \{q \in Q : q \in E(\delta (r,a)) \text{ per qualche } r\in R\}$$

Inoltre anche lo stato iniziale va esteso. Con gli $\varepsilon$-archi, $N$ potrebbe raggiungere altri stati prima ancora di leggere qualsiasi simbolo (attraverso $\varepsilon$-archi uscenti da $q_0$), di conseguenza $q_{0}' = E(\{q_0\})$. Con l'estensione alla chiusura $E(R)$ della funzione di transizione e dello stato iniziale abbiamo completato la costruzione per sottoinsiemi, ottenendo il DFA completo ed equivalente a qualsiasi NFA (anche in presenza di $\varepsilon$-transizioni).

Avendo dimostrato sia l'inclusione banale $\mathcal{L}(\text{DFA}) \subseteq \mathcal{L}(\text{NFA})$ sia l'inclusione $\mathcal{L}(\text{NFA}) \subseteq \mathcal{L}(\text{DFA})$ attraverso la costruzione per sottoinsiemi (estesa anche agli $\varepsilon$-archi), risulta provato che ogni linguaggio riconosciuto da un NFA può essere riconosciuto anche da un DFA equivalente. Pertanto, i due modelli riconoscono esattamente la stessa classe di linguaggi, concludendo che $\mathcal{L}(\text{NFA}) = \mathcal{L}(\text{DFA})$.

---

![[nfa = dfa example.png]]


> [!example] 
> Prendiamo l'NFA $N = (\{q_1,q_2,q_3\},\{a,b\},\delta,q_1,\{q_1\})$ mostrato in figura. Seguendo la procedura definita nella dimostrazione, costruiamo un DFA $D = (Q', \Sigma', \delta', q_{0}', F')$ equivalente a $N$:
> - $Q' = \mathcal{P}(\{q_1,q_2,q_3\}) = \{\emptyset,\{q_1\},\{q_2\},\{q_3\},\{q_1,q_2\},\{q_1,q_3\},\{q_2,q_3\},\{q_1,q_2,q_3\}\}$.
> - Lo stato iniziale è uguale a $E(\{q_1\})$ e dal momento in cui esiste un $\varepsilon$-arco che va da $q_1$ a $q_3$, allora $E(\{q_1\}) = \{q_1,q_3\}$.
> - Gli stati accettanti di $D$ sono tutti gli stati dell'insieme $Q'$ che contengono stati accettanti di $N$, ovvero che contengono $q_1$: $\{\{q_1\}, \{q_1,q_2\}, \{q_1,q_3\}, \{q_1,q_2,q_3\}\}$.
> 
> Determiniamo la funzione di transizione $\delta'$ di $D$ seguendo la computazione di $N$ per ogni stato dell'insieme $Q'$. Ricordiamo che per considerare gli $\varepsilon$-archi va applicata la chiusura $E(\cdot)$ dopo ogni transizione su $a$ e $b$:
> - Nello stato $\{q_1\}$:
  $\delta'(\{q_1\},a)=E(\delta(q_1,a))=E(\emptyset)=\emptyset$
  $\delta'(\{q_1\},b)=E(\delta(q_1,b))=E(\{q_2\})=\{q_2\}$
 > - Nello stato $\{q_2\}$:
  $\delta'(\{q_2\},a)=E(\delta(q_2,a))=E(\{q_2,q_3\})=\{q_2,q_3\}$
  $\delta'(\{q_2\},b)=E(\delta(q_2,b))=E(\{q_3\})=\{q_3\}$
>  - Nello stato $\{q_3\}$:
  $\delta'(\{q_3\},a)=E(\delta(q_3,a))=E(\{q_1\})=\{q_1,q_3\}$
  $\delta'(\{q_3\},b)=E(\delta(q_3,b))=E(\emptyset)=\emptyset$
>  - Nello stato $\{q_1,q_2\}$:
  $\delta'(\{q_1,q_2\},a)=E(\delta(q_1,a) \cup \delta(q_2,a))=E(\emptyset \cup \{q_2,q_3\})=\{q_2,q_3\}$
  $\delta'(\{q_1,q_2\},b)=E(\delta(q_1,b) \cup \delta(q_2,b))=E(\{q_2\} \cup \{q_3\})=\{q_2,q_3\}$
>  - Nello stato $\{q_1,q_3\}$:
  $\delta'(\{q_1,q_3\},a)=E(\delta(q_1,a) \cup \delta(q_3,a))=E(\emptyset \cup \{q_1\})=\{q_1,q_3\}$
  $\delta'(\{q_1,q_3\},b)=E(\delta(q_1,b) \cup \delta(q_3,b))=E(\{q_2\} \cup \emptyset)=\{q_2\}$
>  - Nello stato $\{q_2,q_3\}$:
  $\delta'(\{q_2,q_3\},a)=E(\delta(q_2,a) \cup \delta(q_3,a))=E(\{q_2,q_3\} \cup \{q_1\})=\{q_1,q_2,q_3\}$
  $\delta'(\{q_2,q_3\},b)=E(\delta(q_2,b) \cup \delta(q_3,b))=E(\{q_3\} \cup \emptyset)=\{q_3\}$
>  - Nello stato $\{q_1,q_2,q_3\}$:
  $\delta'(\{q_1,q_2,q_3\},a)=E(\delta(q_1,a) \cup \delta(q_2,a) \cup \delta(q_3,a))=E(\emptyset \cup \{q_2,q_3\} \cup \{q_1\})=\{q_1,q_2,q_3\}$
  $\delta'(\{q_1,q_2,q_3\},b)=E(\delta(q_1,b) \cup \delta(q_2,b) \cup \delta(q_3,b))=E(\{q_2\} \cup \{q_3\} \cup \emptyset)=\{q_2,q_3\}$

![[nfa = dfa example 1.png]]
  
> [!example] 
>  Possiamo semplificare $D$ osservando che nessun arco punta agli stati $\{q_1\}$ e $\{q_1,q_2\}$, quindi essi possono essere tolti senza ripercussioni sulla prestazione della macchina.

![[nfa = dfa example 2.png]]

---
### LINGUAGGI REGOLARI

> [!quote] Theorem
> La classe dei **linguaggi regolari** ($\text{REG}$) è l'insieme di tutti i linguaggi accettati da un DFA: $\text{REG} = \{ L \subseteq \Sigma^* : \exists \text{ un DFA } M \text{ tale che } L(M) = L \} = \mathcal{L}(\text{DFA})$.

![[regular languages example.png]]

> [!example]
> Considerando il linguaggio delle stringhe binari che iniziano con il simbolo $1$:
> 
> $$
> L = \{ x \in \{0, 1\}^* : x = 1y, \text{ con } y \in \{0, 1\}^* \}
> $$
> 
> Il DFA in grado di riconoscere tale linguaggio esiste ed è quello in figura, dunque $L$ è un linguaggio regolare (lo stato $q_1$ è detto stato pozzo o trap state: un particolare stato non accettante dal quale è impossibile uscire).
> 

> [!quote] Corollary
> Dalla definizione di linguaggi regolari e dal [[Automaton#EQUIVALENZA TRA NFA E DFA|teorema di equivalenza]] segue immediatamente che la classe dei linguaggi regolari coincide con la classe dei linguaggi riconosciuti dagli NFA: $\text{REG} = \mathcal{L}(\text{NFA})$.

---
#### Chiusura rispetto alle operazioni regolari

Vogliamo ora dimostrare che la classe dei linguaggi regolari ($\text{REG}$) è chiusa rispetto alle [[Strings#Operazioni sui linguaggi|operazioni]] di unione ($\cup$), concatenazione ($\circ$) e star di Kleene ($*$). Ovvero, che applicando tali operazioni a uno o più linguaggi regolari, il linguaggio risultante è anch'esso regolare.

---
##### Chiusura rispetto all'unione

> [!quote] Theorem
> La classe dei linguaggi regolari è chiusa rispetto all'operazione di unione

**Dimostrazione:**

Prendiamo due linguaggi regolari $A_1$ e $A_2$ e proviamo che $A_1 \cup A_2$ è regolare. Per definizione, poiché $A_1$ e $A_2$ sono regolari, esistono due NFA $N_1 = (Q_1, \Sigma_1, \delta_1, q_1, F_1)$ e $N_2 = (Q_2, \Sigma_2, \delta_2, q_2, F_2)$ che riconoscono rispettivamente i due linguaggi. Per dimostrare la tesi, costruiamo un nuovo NFA $N = (Q, \Sigma, \delta, q_0, F)$ che combini $N_1$ e $N_2$. Il nuovo automa $N$ deve configurarsi in modo tale da accettare una stringa di input se e solo se questa viene accettata da almeno uno dei due automi di partenza ($N_1$ oppure $N_2$):

- $Q = \{q_0\} \cup Q_1 \cup Q_2$ è l'insieme degli stati di $N$,
- $q_0$ è lo stato iniziale di $N$,
- $F = F_1 \cup F_2$ è l'insieme degli stati accettanti di $N$,
- Per ogni $q \in Q$ e ogni $a \in \Sigma_\varepsilon$: $$\delta(q,a) = \begin{cases} \delta_1(q,a)\quad q \in Q_1 \\ \delta_2(q,a) \quad q \in Q_2 \\ \{q_1,q_2\} \quad q = q_0 \text{ e } a = \varepsilon \\ \emptyset \qquad\quad\space\space\space q = q_0 \text{ e } a \neq \varepsilon \end{cases}$$

![[union closure.png]]

Come è mostrato nella figura, $N$ ha uno stato iniziale che si dirama nei precedenti stati iniziali di $N_1$ e $N_2$ con $\varepsilon$-archi, in questo modo la nuova macchina ipotizza non deterministicamente quale delle due macchine accetta l'input: se almeno una di esse accetta l'input, anche $N$ lo accetterà.

---
##### Chiusura rispetto alla concatenazione

> [!quote] Theorem
> La classe dei linguaggi regolari è chiusa rispetto all'operazione di concatenazione

**Dimostrazione:**

Prendiamo due linguaggi regolari $A_1$ e $A_2$ e proviamo che $A_1 \circ A_2$ è regolare. Per definizione, poiché $A_1$ e $A_2$ sono regolari, esistono due NFA $N_1 = (Q_1, \Sigma_1, \delta_1, q_1, F_1)$ e $N_2 = (Q_2, \Sigma_2, \delta_2, q_2, F_2)$ che riconoscono rispettivamente i due linguaggi. Per dimostrare la tesi, costruiamo un nuovo NFA $N = (Q, \Sigma, \delta, q_1, F_2)$ che combini $N_1$ e $N_2$. Il nuovo automa $N$ deve configurarsi in modo tale da accettare una stringa di input se e solo se la stringa può essere divisa in due parti, la prima accettata da $N_1$ e la seconda accettata da $N_2$:

- $Q = Q_1 \cup Q_2$ è l'insieme degli stati di $N$,
- $q_1$ è lo stato iniziale di $N$,
- $F_2$ è l'insieme degli stati accettanti di $N$,
- Per ogni $q \in Q$ e ogni $a \in \Sigma_\varepsilon$: $$\delta(q,a) = \begin{cases} \delta_1(q,a)\qquad\qquad q \in Q_1 \text{ e } q \notin F_1 \\ \delta_1(q,a) \qquad\qquad q \in F_1 \text{ e } a \neq \varepsilon \\ \delta_1(q,a) \cup \{q_2\} \quad q \in F_1 \text{ e } a = \varepsilon \\ \delta_2(q,a)\qquad\qquad q \in Q_2 \end{cases}$$

![[concatenation closure.png]]

Come è mostrato nella figura, $N$ ha come stato iniziale lo stato iniziale di $N_1$, mentre gli stati finali di $N_1$ sono diventati degli stati intermedi di $N$ che confluiscono nel  precedenti stato iniziale di $N_2$ tramite $\varepsilon$-archi. Gli stati accettanti di $N$ rimangono quelli di $N_2$. In questo modo la nuova macchina permette di spostarsi non deterministicamente in $N_2$ ogni volta che $N_1$ è in uno stato accettante, dunque $N$ finisce in uno stato accettante se la prima parte dell'input è accettata da $N_1$ e la seconda parte dell'input è accettata da $N_2$.

---
##### Chiusura rispetto all'operazione star

> [!quote] Theorem
> La classe dei linguaggi regolari è chiusa rispetto all'operazione star

**Dimostrazione:**

Prendiamo un linguaggio regolare $A_1$ e proviamo che $A_1^*$ è regolare. Per definizione, poiché $A_1$ è regolare, esiste un NFA $N_1 = (Q_1, \Sigma, \delta_1, q_1, F_1)$ che lo riconosce. Per dimostrare la tesi, costruiamo un nuovo NFA $N = (Q, \Sigma, \delta, q_0, F)$ modificando l'automa $N_1$. Il nuovo automa $N$ deve configurarsi in modo tale da riconoscere $A_1^*$, e quindi accettare una stringa di input se e solo se questa può essere divisa in varie parti ed $N_1$ accetta ognuna di queste parti:

- $Q = \{q_0\} \cup Q_1$ è l'insieme degli stati di $N$,
- $q_0$ è lo stato iniziale di $N$,
- $F = \{q_0\} \cup F_1$ è l'insieme degli stati accettanti di $N$,
- Per ogni $q \in Q$ e ogni $a \in \Sigma_\varepsilon$: $$\delta(q,a) = \begin{cases} \delta_1(q,a)\qquad\qquad q \in Q_1 \text{ e } q \notin F_1 \\ \delta_1(q,a) \qquad\qquad q \in F_1 \text{ e } a \neq \varepsilon \\ \delta_1(q,a) \cup \{q_1\} \quad q \in F_1 \text{ e } a = \varepsilon \\ \{q_1\} \space\quad\qquad\qquad q = q_0 \text{ e } a = \varepsilon \\ \emptyset \space\space\space\qquad\qquad\qquad q = q_0 \text{ e } a \neq \varepsilon \end{cases}$$

![[star closure.png]]

Come è mostrato nella figura, $N$ ha uno stato iniziale $q_0$ che punta nel precedente stato iniziale $q_1$ di $N_1$ con un $\varepsilon$-arco. Anche gli stati finali di $N$ puntano con degli $\varepsilon$-archi a $q_1$. In questo modo la nuova macchina può ripetere il processo e accettare la concatenazione di un numero arbitrario di stringhe di $A_1$. Infine, poiché lo stato iniziale $q_0$ appartiene anche all'insieme degli stati finali $F$ ($q_0 \in F$), la stringa vuota $\varepsilon$ viene accettata con il cammino nullo, garantendo correttamente che $\varepsilon \in A_1^*$.

---
### ESPRESSIONI REGOLARI

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
#### Regole e identità nelle espressioni regolari

Quando si valuta un'espressione regolare senza parentesi, le operazioni si applicano secondo la seguente gerarchia (dalla più forte alla più debole): $* \succ \circ \succ \cup$. Inoltre, nelle operazioni che comprendono $\varepsilon$ e $\emptyset$, riconosciamo le seguenti identità:

$$\begin{array}{|l|l|l|} 
\hline 
\textbf{Elemento} & \textbf{Proprietà / Descrizione} & \textbf{Identità} \\ 
\hline 
\text{Insieme Vuoto } (\emptyset) & \text{Elemento neutro dell'unione} & R \cup \emptyset = R \\ 
& \text{Elemento assorbente della concatenazione} & R \circ \emptyset = \emptyset \\ 
& \text{Chiusura di Kleene dell'insieme vuoto} & \emptyset^* = \varepsilon \\ 
\hline 
\text{Stringa Vuota } (\varepsilon) & \text{Elemento neutro della concatenazione} & R \circ \varepsilon = R \\ 
& \text{Chiusura di Kleene della stringa vuota} & \varepsilon^* = \{\varepsilon\} \\ 
\hline 
\end{array}$$

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
#### Equivalenza con gli automi finiti

Le espressioni regolari e gli automi finiti sono equivalenti rispetto alla loro potenza descrittiva: ogni espressione regolare può essere trasformata in un automa finito che riconosce il linguaggio che essa descrive, e viceversa (ricorda il [[Automaton#LINGUAGGI REGOLARI|teorema]]).

> [!quote] Theorem
> Un linguaggio $A \subseteq \Sigma^*$ è regolare se e solo se esiste un'espressione regolare $R \in \text{re}(\Sigma)$ tale che $L(R) = A$.

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

- Se $R = R_1 \cup R_2$: dalla definizione si ha $L(R) = L(R_1) \cup L(R_2)$. Per ipotesi induttiva, $L(R_1)$ e $L(R_2)$ sono riconosciuti dagli automi $N_1$ e $N_2$. Poiché la classe dei linguaggi regolari è [[Automaton#Chiusura rispetto all'unione|chiusa rispetto all'unione]], è possibile costruire un NFA $N$ che riconosce $L(N_1) \cup L(N_2)$ mediante l'aggiunta di un nuovo stato iniziale e $\varepsilon$-archi verso gli stati iniziali $N_1$ e $N_2$. Ne consegue che $L(N) = L(R_1) \cup L(R_2) = L(R)$.
- Se $R = R_1 \circ R_2$: dalla definizione si ha $L(R) = L(R_1) \circ L(R_2)$. Per ipotesi induttiva, $L(R_1)$ e $L(R_2)$ sono riconosciuti dagli automi $N_1$ e $N_2$. Poiché la classe dei linguaggi regolari è [[Automaton#Chiusura rispetto alla concatenazione|chiusa rispetto alla concatenazione]], è possibile costruire un NFA $N$ che riconosce $L(N_1) \circ L(N_2)$ collegando tutti gli stati finali di $N_1$ allo stato iniziale di $N_2$ tramite $\varepsilon$-archi. Ne consegue che $L(N) = L(R_1) \circ L(R_2) = L(R)$.
- Se $R = R_1^*$: dalla definizione si ha $L(R) = L(R_1)^*$. Per ipotesi induttiva, $L(R_1)$ e $L(R_2)$ sono riconosciuti dagli automi $N_1$ e $N_2$. Poiché la classe dei linguaggi regolari è [[Automaton#Chiusura rispetto all'operazione star|chiusa rispetto all'operazione star]], è possibile costruire un NFA $N$ che riconosce $L(N_1)^*$ aggiungendo un nuovo stato accettante, un $\varepsilon$-arco da questo al vecchio stato iniziale, e $\varepsilon$-archi che riportano dagli stati di accettazione di $N_1$ al suo stato iniziale. Ne consegue che $L(N) = L(R_1)^* = L(R)$.


> [!example] 
> Trasformiamo l'espressione regolare $(\text{ab} \cup \text{a})^*$ in un NFA, partendo dalle sottoespressioni più piccole a quelle più grandi.

![[(ab U a)* example.png]]
![[(ab U a)* example 1.png]]
![[(ab U a)* example 2.png]]

