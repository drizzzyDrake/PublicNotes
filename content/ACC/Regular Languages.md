I **linguaggi regolari** costituiscono una classe fondamentale dei linguaggi formali, definita come l'insieme di tutti i linguaggi che possono essere riconosciuti da un [[Finite Automaton|automa finito]].

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
> Dalla definizione di linguaggi regolari e dal [[Finite Automaton#EQUIVALENZA TRA NFA E DFA|teorema di equivalenza]] segue immediatamente che la classe dei linguaggi regolari coincide con la classe dei linguaggi riconosciuti dagli NFA: $\text{REG} = \mathcal{L}(\text{NFA})$.

---
### CHIUSURA RISPETTO ALLE OPERAZIONI REGOLARI

Vogliamo ora dimostrare che la classe dei linguaggi regolari ($\text{REG}$) è chiusa rispetto alle [[Strings#Operazioni sui linguaggi|operazioni]] di unione ($\cup$), concatenazione ($\circ$) e star di Kleene ($*$). Ovvero, che applicando tali operazioni a uno o più linguaggi regolari, il linguaggio risultante è anch'esso regolare.

---
#### Chiusura rispetto all'unione

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
#### Chiusura rispetto alla concatenazione

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
#### Chiusura rispetto all'operazione star

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