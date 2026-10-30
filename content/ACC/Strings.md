Una stringa è una sequenza di caratteri. Una stringa è definita su un alfabeto, che varia a seconda dell'applicazione. Si definisce **alfabeto** un qualsiasi insieme finito non vuoto. Gli elementi dell'alfabeto sono detti **simboli**. Gli alfabeti si indicano con le lettere $\Sigma$ e $\Gamma$. 

> [!example] 
> Esempi di alfabeti : $\Sigma_{1} = \{0, 1\}$,  $\Gamma = \{\text{0, 1, x, y, z}\}$,  $\Sigma_{2} = \{\text{a, b, c, d, e, f, g , h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z}\}$

Data una sequenza di simboli $w_{1}, ..., w_{n} \in \Sigma$, definiamo $w = w_{1} ... w_{n}$ una **stringa di** $\Sigma$, ovvero una sequenza finita di simboli dell'alfabeto, scritti uno di seguito all'altro. La lunghezza di $w$, indicata con $|w|$ è il numero di simboli da essa contenuti. 

> [!example] 
> Se $\Sigma_{1} = \{0, 1\}$ allora $\text{01001}$ è una stringa su $\Sigma_{1}$, se $\Sigma_{2} = \{\text{a, b, c, ..., z}\}$, allora $\text{cactusjack}$ è una stringa su $\Sigma_{2}$.

Definiamo **potenza di un alfabeto** $\Sigma^k$ l'insieme di tutte le stringhe di lunghezza esattamente $k$ formate con i simboli dell'alfabeto $\Sigma$.

> [!example] 
> Se $k = 2$ e $\Sigma = \{0, 1\}$ allora $\Sigma^2 = \{0, 1\}^2 = \{00, 01, 10, 11\}$.

---
### STRINGA VUOTA

La **stringa di lunghezza zero** è chiamata **stringa vuota** ed è indicata con $\varepsilon$. Ha le seguenti proprietà: 1) $|\varepsilon| = 0$, 2) $\forall w \in \Sigma^{*} : w \varepsilon = \varepsilon w = w$, 3)  $\Sigma^{*} \neq \emptyset \implies \varepsilon \in \Sigma^{*}$.  

---
### OPERAZIONI SULLE STRINGHE

L'**inversa** di $w$, indicata con $w^{\mathcal{R}}$ è la stringa ottenuta scrivendo $w$ in ordine inverso (ovvero $w_{\text{n}}w_{\text{n - 1}}...w_{1}$). La stringa $z$ è una **sottostringa** di $w$ se $z$ appare consecutivamente in $w$. Data una stringa $x$ di lunghezza $m$ e una stringa $y$ di lunghezza $n$, la **concatenazione** di $x$ e $y$, scritta $xy$, è la stringa ottenuta aggiungendo $y$ alla fine di $x$, come $x_{1}...x_{m}y_{1}...y_{n}$. Per concatenare una stringa con se stessa $k$ volte si utilizza la notazione $w^{k}$ (con $w^{0} = \varepsilon$).

> [!example] 
> Data la stringa $w = \text{jack}$ allora: $w^{\mathcal{R}} = \text{kcaj}$, $w^{2} = \text{jackjack}$ e, data $y = \text{cactus}$, $yw = \text{cactusjack}$.

---
### LINGUAGGI

Un **linguaggio** è un **insieme di stringhe**. Dunque, dato l'alfabeto $\Sigma$ definiamo come **linguaggio di** $\Sigma$ (o **chiusura di kleene** di $\Sigma$), indicato come $\Sigma^{*}$, l'insieme di tutte le stringhe possibili che si possono costruire con i simboli di $\Sigma$, inclusa la stringa vuota $\varepsilon$. Invece, un linguaggio specifico $L$ su un alfabeto $\Sigma$ è un sottoinsieme di $\Sigma^*$ ($L \subseteq \Sigma^*$).

> [!example]
> Se $\Sigma = \{0, 1\}$ allora $\Sigma^*$ include $\{\varepsilon, 0, 1, 00, 11, 01, 10, 11, 000, ...\}$. Se $L = \{1, 11, 111\}$ allora $L \subseteq \Sigma^*$.

---
#### Operazioni sui linguaggi

Dati due linguaggi $L_1, L_2 \subseteq \Sigma^*$, si definiscono le seguenti operazioni algebriche:

$$
\begin{array}{|l|l|}
\hline
\textbf{Operazione} & \textbf{Definizione} \\
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
