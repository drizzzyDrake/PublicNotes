Un **grafo non orientato**, o semplicemente grafo, è un insieme di punti connessi da un insieme di linee. I punti sono chiamati **nodi** o **vertici**, mentre le linee sono chiamate **archi**.

![[graph examples.png]]

Il numero di archi ad un particolare nodo è il **grado** di tale nodo. Non è permesso più di un arco tra due nodi. Possono esistere archi da un nodo a se stesso chiamati **self-loop**. In un grafo $\text{G}$ che contiene i nodi $\text{i}$ e $\text{j}$ la coppia $\text{(i, j)}$ rappresenta l'arco che collega $\text{i}$ e $\text{j}$. Inoltre, in un grafo non orientato, le coppie $\text{(i, j)}$ e $\text{(j, i)}$ rappresentano lo stesso arco, dunque si può adottare la notazione insiemistica $\text{(i, j) = (j, i) = \{i, j\}}$.

> [!example] 
> Nella figura **a** tutti i nodi hanno grado 2, mentre nella **b** tutti i nodi hanno grado 3. 

Se $\text{V}$ è l'insieme di nodi di $\text{G}$ ed $\text{E}$ è l'insieme degli archi, scriviamo $\text{G = (V, E)}$. Possiamo quindi descrivere un grafo formalmente specificando $\text{V}$ ed $\text{E}$.

> [!example] 
> Una descrizione formale del grafo nella figura **a**: 
> - $\text{(\{1, 2, 3, 4, 5\}, \{(1, 2), (2, 3), (3, 4), (4, 5), (5, 1)\})}$
> 
> Una descrizione formale del grafo nella figura **b**: 
> - $\text{(\{1, 2, 3, 4\}, \{(1, 2), (1, 3), (1, 4), (2, 3), (2, 4), (3, 4)\})}$

Un **cammino** in un grafo è una sequenza di nodi collegati da archi. Un **cammino semplice** è un cammino che non contiene nodi ripetuti. Un grafo si dice **connesso** se per ogni coppia di nodi esiste un cammino tra di loro. 

![[graph path.png]]

Un cammino è un **ciclo** se inizia e termina nello stesso nodo. Un **ciclo semplice** è un ciclo che contiene almeno tre nodi e ripete solo il primo e l'ultimo nodo. Un grafo connesso che non ha cicli semplici è chiamato **albero**.

> [!example] 
> Un cammino in un grafo (figura **c**), un albero (figura **d**), un ciclo in un grafo (figura **e**).  

---
### SOTTOGRAFI

Diciamo che il grafo $\text{G}$ è un **sottografo** del grafo $\text{H}$ se i nodi di $\text{G}$ sono un sottoinsieme dei nodi di $\text{H}$ e gli archi di $\text{G}$ sono anche archi di $\text{H}$ sui nodi corrispondenti .

![[subgraph.png]]

---
### GRAFI ORIENTATI

Un **grafo orientato** (o **diretto**) ha frecce invece di linee. Il numero delle frecce che escono da un nodo è il **grado uscente** di quel nodo, ed il numero delle frecce che entrano in un particolare nodo è il **grado entrante**. 

![[directed graph.png]]

Un cammino in cui tutte le frecce puntano nella stessa direzione del cammino si definisce **cammino orientato** (o diretto). Un grafo orientato è **fortemente connesso** se per ogni coppia di vertici esiste almeno un cammino orientato che li collega. I grafi orientati sono utili per descrivere relazioni binarie. Se $\text{R}$ è una relazione binaria il cui dominio è $\text{D} \times \text{D}$, un grafo etichettato $\text{G = (D, E)}$ rappresenta $\text{R}$, dove $\text{E = \{(x, y)| xRy\}}$ (insieme degli archi).

---
