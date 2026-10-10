Una stringa è una sequenza di caratteri. Una stringa è definita su un alfabeto, che varia a seconda dell'applicazione. Si definisce **alfabeto** un qualsiasi insieme finito non vuoto. Gli elementi dell'alfabeto sono detti **simboli**. Gli alfabeti si indicano con le lettere $\large \Sigma$ e $\large \Gamma$. 

> [!example] 
> Esempi di alfabeti : $\large \Sigma_{1} = \{0, 1\}$,  $\large \Gamma = \{\text{0, 1, x, y, z}\}$,  $\large \Sigma_{2} = \{\text{a, b, c, d, e, f, g , h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z}\}$

Data una sequenza di simboli $\large w_{1}, ..., w_{n} \in \Sigma$, definiamo $\large w = w_{1} ... w_{n}$ una **stringa di** $\large \Sigma$, ovvero una sequenza finita di simboli dell'alfabeto, scritti uno di seguito all'altro. La lunghezza di $\large w$, indicata con $\large |w|$ è il numero di simboli da essa contenuti. 

> [!example] 
> Se $\large \Sigma_{1} = \{0, 1\}$ allora $\large \text{01001}$ è una stringa su $\large \Sigma_{1}$, se $\large \Sigma_{2} = \{\text{a, b, c, ..., z}\}$, allora $\large \text{cactusjack}$ è una stringa su $\large \Sigma_{2}$.

Definiamo **potenza di un alfabeto** $\large \Sigma^k$ l'insieme di tutte le stringhe di lunghezza esattamente $\large k$ formate con i simboli dell'alfabeto $\large\Sigma$.

> [!example] 
> Se $\large k = 2$ e $\large \Sigma = \{0, 1\}$ allora $\large \Sigma^2 = \{0, 1\}^2 = \{00, 01, 10, 11\}$.

---
### STRINGA VUOTA

La **stringa di lunghezza zero** è chiamata **stringa vuota** ed è indicata con $\large \varepsilon$. Ha le seguenti proprietà: 1) $\large |\varepsilon| = 0$, 2) $\large \forall w \in \Sigma^{*} : w \varepsilon = \varepsilon w = w$, 3)  $\large \Sigma^{*} \neq \emptyset \implies \varepsilon \in \Sigma^{*}$.  

---
### OPERAZIONI SULLE STRINGHE

L'**inversa** di $\large w$, indicata con $\large w^{\mathcal{R}}$ è la stringa ottenuta scrivendo $\large w$ in ordine inverso (ovvero $\large w_{\text{n}}w_{\text{n - 1}}...w_{1}$). La stringa $\large z$ è una **sottostringa** di $\large w$ se $\large z$ appare consecutivamente in $\large w$. Data una stringa $\large x$ di lunghezza $\large m$ e una stringa $\large y$ di lunghezza $\large n$, la **concatenazione** di $\large x$ e $\large y$, scritta $\large xy$, è la stringa ottenuta aggiungendo $\large y$ alla fine di $\large x$, come $\large x_{1}...x_{m}y_{1}...y_{n}$. Per concatenare una stringa con se stessa $\large k$ volte si utilizza la notazione $\large w^{k}$ (con $\large w^{0} = \varepsilon$).

> [!example] 
> Data la stringa $\large w = \text{jack}$ allora: $\large w^{\mathcal{R}} = \text{kcaj}$, $\large w^{2} = \text{jackjack}$ e, data $\large y = \text{cactus}$, $\large yw = \text{cactusjack}$.

---
### LINGUAGGI

Un **linguaggio** è un **insieme di stringhe**. Dunque, dato l'alfabeto $\large \Sigma$ definiamo come **linguaggio di** $\large \Sigma$ (o **chiusura di kleene** di $\large\Sigma$), indicato come $\large \Sigma^{*}$, l'insieme di tutte le stringhe possibili che si possono costruire con i simboli di $\large \Sigma$, inclusa la stringa vuota $\large \varepsilon$. Invece, un linguaggio specifico $\large L$ su un alfabeto $\large \Sigma$ è un sottoinsieme di $\large \Sigma^*$ ($\large L \subseteq \Sigma^*$).

> [!example]
> Se $\large \Sigma = \{0, 1\}$ allora $\large \Sigma^*$ include $\large\{\varepsilon, 0, 1, 00, 11, 01, 10, 11, 000, ...\}$. Se $\large L = \{1, 11, 111\}$ allora $\large L \subseteq \Sigma^*$.

---
#### Operazioni sui linguaggi

Dati due linguaggi $\large L_1, L_2 \subseteq \Sigma^*$, si definiscono le seguenti operazioni algebriche:

$$
\large
\begin{array}{|l|l|}
\hline
\textbf{operazione} & \textbf{definizione} \\
\hline
\text{unione} & L_1 \cup L_2 = \{ x \in \Sigma^* : x \in L_1 \lor x \in L_2 \} \\
\hline
\text{intersezione} & L_1 \cap L_2 = \{ x \in \Sigma^* : x \in L_1 \land x \in L_2 \} \\
\hline
\text{complemento} & \overline{L_1} = \{ x \in \Sigma^* : x \notin L_1 \} \\
\hline
\text{concatenazione} & L_1 \circ L_2 = \{ xy : x \in L_1 \land y \in L_2 \} \\
\hline
\text{potenza} & L^n =\begin{cases}\{\varepsilon\} \quad \text{se}\ n = 0 \\ L \circ L^{n-1}\quad\text{se}\ n > 0  \end{cases} \\
\hline
\text{star di Kleene} & L^* = \{w_1 ... w_k \in \Sigma^* : k \geq 0, \forall i \in [1,k]\ w_i \in L\} = \bigcup\limits_{n \geq 0} L^n \\
\hline
\end{array}
$$

> [!important]
> Sui linguaggi valgono anche le [[Boolean Logic#LEGGI DI DE MORGAN|leggi di DeMorgan]].

---
