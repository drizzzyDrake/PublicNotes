

## Teorema di Chiusura dell'Unione (Costruzione Prodotto)

**TEOREMA:** La classe $\text{REG}$ è chiusa rispetto alle operazioni di unione ($\cup$), intersezione ($\cap$), complemento ($\overline{\phantom{L}}$), concatenazione ($\circ$) e stella di Kleene ($*$).

### Dimostrazione (Chiusura rispetto all'Unione $\cup$)

Siano $L_1 = L(M_1)$ e $L_2 = L(M_2)$ due linguaggi regolari riconosciuti dai DFA:
$$M_1 = (Q_1, \Sigma, \delta_1, q_1, F_1) \quad \text{e} \quad M_2 = (Q_2, \Sigma, \delta_2, q_2, F_2) \text{[cite: 3]}$$
Si costruisce un automa $M = (Q, \Sigma, \delta, q_0, F)$ che simula in parallelo l'elaborazione di $M_1$ ed $M_2$:
1. **Insieme degli stati:** $Q = Q_1 \times Q_2 = \{ (r_1, r_2) : r_1 \in Q_1 \land r_2 \in Q_2 \}$
2. **Stato iniziale:** $q_0 = (q_1, q_2)$
3. **Funzione di transizione:** $\delta((r_1, r_2), a) = (\delta_1(r_1, a), \delta_2(r_2, a))$ per ogni $a \in \Sigma$
4. **Stati finali:** $F = (F_1 \times Q_2) \cup (Q_1 \times F_2) = \{ (r_1, r_2) : r_1 \in F_1 \lor r_2 \in F_2 \}$

**Correttezza:** $x \in L(M) \iff \delta^*(q_0, x) \in F \iff \delta_1^*(q_1, x) \in F_1 \lor \delta_2^*(q_2, x) \in F_2 \iff x \in L_1 \cup L_2$.

---


computazione divisa nelle 3 parti del corso
- computazione a memoria finita: automi finiti
- computazione con memoria a pila: automi a pila
- computazione universale e limiti: macchine di turing (calcolabilità)