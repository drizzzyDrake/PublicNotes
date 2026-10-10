La **logica booleana** è un sistema matematico costruito intorno ai due valori **vero** e **falso** (valori booleani) rappresentati rispettivamente dai numeri **1** e **0**.

---
### OPERAZIONI BOOLEANE

Siamo in grado di manipolare i valori booleani attraverso le **operazioni booleane**. L'operazione più semplice è la **negazione** (**not**): $\large \lnot 0 = 1 \quad \lnot 1 = 0$. Tra le altre troviamo:

$$
\large
\begin{array}{|l|c|c|c|c|c|}
\hline
\textbf{Operazione} & \textbf{Simbolo} & \mathbf{0 \text{ e } 0} & \mathbf{0 \text{ e } 1} & \mathbf{1 \text{ e } 0} & \mathbf{1 \text{ e } 1} \\
\hline
\text{Congiunzione (and)} & \land & 0 \land 0 = 0 & 0 \land 1 = 0 & 1 \land 0 = 0 & 1 \land 1 = 1 \\
\hline
\text{Disgiunzione (or)} & \lor & 0 \lor 0 = 0 & 0 \lor 1 = 1 & 1 \lor 0 = 1 & 1 \lor 1 = 1 \\
\hline
\text{Or esclusivo (xor)} & \oplus & 0 \oplus 0 = 0 & 0 \oplus 1 = 1 & 1 \oplus 0 = 1 & 1 \oplus 1 = 0 \\
\hline
\text{Uguaglianza (xnor)} & \leftrightarrow & 0 \leftrightarrow 0 = 1 & 0 \leftrightarrow 1 = 0 & 1 \leftrightarrow 0 = 0 & 1 \leftrightarrow 1 = 1 \\
\hline
\text{Implicazione} & \to & 0 \to 0 = 1 & 0 \to 1 = 1 & 1 \to 0 = 0 & 1 \to 1 = 1 \\
\hline
\end{array}
$$

> [!tip]
> Usiamo le operazioni booleane per combinare asserzioni semplici in espressioni complesse. Siamo infatti in grado di esprimere tutte le operazioni booleane in termini di operazioni **and** e **not**: 
> 
> - $\large P \lor Q$ equivale a scrivere $\large \lnot(\lnot P \land \lnot Q)$
> - $\large P \to Q$ equivale a scrivere $\large \lnot P \lor Q$
> - $\large P \leftrightarrow Q$ equivale a scrivere $\large (P \to Q) \land (Q \to P)$
> - $\large P \oplus Q$ equivale a scrivere $\large \lnot(P \leftrightarrow Q)$
> 

---
### LEGGE DISTRIBUTIVA

La **legge distributiva** descrive come due operatori booleani interagiscono tra loro. A differenza dell'algebra classica, nella logica booleana la congiunzione ($\land$) distribuisce sulla disgiunzione ($\lor$) e viceversa, consentendo di semplificare e trasformare le espressioni complesse.

- $\large P \land (Q \lor R)$ è uguale a $\large (P \land Q) \lor (P \land R)$
- $\large P \lor (Q \land R)$ è uguale a $\large (P \lor Q) \land (P \lor R)$

---
### LEGGI DI DE MORGAN

Le **leggi di De Morgan** spiegano come la negazione ($\lnot$) si distribuisce sui connettivi $\land$ e $\lor$. Permettono di trasformare una congiunzione in una disgiunzione (e viceversa) invertendo i valori dei singoli termini, fondamentale per la semplificazione dei circuiti logici.

- $\large \lnot(P \land Q)$ equivale a scrivere $\large \lnot P \lor \lnot Q$
- $\large \lnot(P \lor Q)$ equivale a scrivere $\large \lnot P \land \lnot Q$

---
### LEGGI DI ASSORBIMENTO

Le **leggi di assorbimento** consentono di eliminare termini ridondanti all'interno di un'espressione booleana. Quando una variabile compare sia all'esterno sia all'interno di una parentesi accoppiata con l'operatore opposto, l'intera parentesi viene "assorbita".

- $\large P \lor (P \land Q)$ equivale a scrivere $\large P$
- $\large P \land (P \lor Q)$ equivale a scrivere $\large P$

---