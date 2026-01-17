Restituiscono `true` o `false` a seconda della condizione.

| Operatore | Descrizione       | Esempio (`a = 10`, `b = 5`) |
| --------- | ----------------- | --------------------------- |
| `==`      | Uguale            | `a == b // false`           |
| `!=`      | Diverso           | `a != b // true`            |
| `>`       | Maggiore          | `a > b // true`             |
| `<`       | Minore            | `a < b // false`            |
| `>=`      | Maggiore o uguale | `a >= b // true`            |
| `<=`      | Minore o uguale   | `a <= b // false`           |

---
### RIFERIMENTO VS CONTENUTO

La differenza tra `equals()` e `==` in Java è fondamentale, perché **hanno scopi diversi**:

---
#### Confronto di riferimento (`==`)

Funziona sia su **oggetti che su tipi primitivi**, ma nei primitivi confronta **il valore**, mentre negli oggetti confronta **l’indirizzo in memoria**.

```java
String a = new String("Java");
String b = new String("Java");

System.out.println(a == b); // false, due oggetti diversi
```

Qui `a` e `b` contengono lo stesso testo, ma sono **due oggetti distinti**.

```java
int x = 5;
int y = 5;
System.out.println(x == y); // true, confronta i valori
```

Confronto basato sul **valore**.

---
#### Confronto di contenuto (`equals()`)

Confronta **il contenuto/logica di uguaglianza** tra oggetti. È un metodo definito in `Object` e spesso **sovrascritto** (override) dalle classi.

```java
String a = new String("Java");
String b = new String("Java");

System.out.println(a.equals(b)); // true, stesso contenuto
```

Qui `equals()` confronta il **contenuto della stringa**, non l’indirizzo in memoria.

---
#### Esempio

```java
class Punto {
    int x, y;
    Punto(int x, int y){ this.x = x; this.y = y; }
}

Punto p1 = new Punto(1,2);
Punto p2 = new Punto(1,2);

System.out.println(p1 == p2);       // false, riferimenti diversi
System.out.println(p1.equals(p2));  // false, perché equals non è sovrascritto
```

**Se vogliamo confrontare i valori:**

```java
class Punto {
    int x, y;
    Punto(int x, int y){ this.x = x; this.y = y; }

    @Override
    public boolean equals(Object o){
        if(o instanceof Punto p){
            return this.x == p.x && this.y == p.y;
        }
        return false;
    }
}
```

```java
System.out.println(p1.equals(p2));   // true, ora confronta i valori
```

---

