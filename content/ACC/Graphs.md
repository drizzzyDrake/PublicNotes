Un **grafo non orientato**, o semplicemente grafo, è un insieme di punti connessi da un insieme di linee. I punti sono chiamati **nodi** o **vertici**, mentre le linee sono chiamate **archi**.

![[graph examples.png]]

Il numero di archi ad un particolare nodo è il **grado** di tale nodo. Non è permesso più di un arco tra due nodi. Possono esistere archi da un nodo a se stesso chiamati **self-loop**. In un grafo $\large \text{G}$ che contiene i nodi $\large \text{i}$ e $\large \text{j}$ la coppia $\large \text{(i, j)}$ rappresenta l'arco che collega $\large \text{i}$ e $\large \text{j}$. Inoltre, in un grafo non orientato, le coppie $\large \text{(i, j)}$ e $\large \text{(j, i)}$ rappresentano lo stesso arco, dunque si può adottare la notazione insiemistica $\large \text{(i, j) = (j, i) = \{i, j\}}$.

> [!example] 
> Nella figura **a** tutti i nodi hanno grado 2, mentre nella **b** tutti i nodi hanno grado 3. 

Se $\large \text{V}$ è l'insieme di nodi di $\large \text{G}$ ed $\large \text{E}$ è l'insieme degli archi, scriviamo $\large \text{G = (V, E)}$. Possiamo quindi descrivere un grafo formalmente specificando $\large \text{V}$ ed $\large \text{E}$.

> [!example] 
> Una descrizione formale del grafo nella figura **a**: 
> - $\large \text{(\{1, 2, 3, 4, 5\}, \{(1, 2), (2, 3), (3, 4), (4, 5), (5, 1)\})}$
> 
> Una descrizione formale del grafo nella figura **b**: 
> - $\large \text{(\{1, 2, 3, 4\}, \{(1, 2), (1, 3), (1, 4), (2, 3), (2, 4), (3, 4)\})}$

Un **cammino** in un grafo è una sequenza di nodi collegati da archi. Un **cammino semplice** è un cammino che non contiene nodi ripetuti. Un grafo si dice **connesso** se per ogni coppia di nodi esiste un cammino tra di loro. 

![[graph path.png]]

Un cammino è un **ciclo** se inizia e termina nello stesso nodo. Un **ciclo semplice** è un ciclo che contiene almeno tre nodi e ripete solo il primo e l'ultimo nodo. Un grafo connesso che non ha cicli semplici è chiamato **albero**.

> [!example] 
> Un cammino in un grafo (figura **c**), un albero (figura **d**), un ciclo in un grafo (figura **e**).  

---
### SOTTOGRAFI

Diciamo che il grafo $\large \text{G}$ è un **sottografo** del grafo $\large \text{H}$ se i nodi di $\large \text{G}$ sono un sottoinsieme dei nodi di $\large \text{H}$ e gli archi di $\large \text{G}$ sono anche archi di $\large \text{H}$ sui nodi corrispondenti .

![[subgraph.png]]

---
### GRAFI ORIENTATI

Un **grafo orientato** (o **diretto**) ha frecce invece di linee. Il numero delle frecce che escono da un nodo è il **grado uscente** di quel nodo, ed il numero delle frecce che entrano in un particolare nodo è il **grado entrante**. 

![[directed graph.png]]

Un cammino in cui tutte le frecce puntano nella stessa direzione del cammino si definisce **cammino orientato** (o diretto). Un grafo orientato è **fortemente connesso** se per ogni coppia di vertici esiste almeno un cammino orientato che li collega. I grafi orientati sono utili per descrivere relazioni binarie. Se $\large \text{R}$ è una relazione binaria il cui dominio è $\large \text{D} \times \text{D}$, un grafo etichettato $\large \text{G = (D, E)}$ rappresenta $\large \text{R}$, dove $\large \text{E = \{(x, y)| xRy\}}$ (insieme degli archi).

---
