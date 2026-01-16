Il **Singleton** è un **[[Design Pattern#Creational patterns|creational design pattern]]** che garantisce che una classe abbia **una sola istanza** e fornisce un **punto di accesso globale** a tale istanza. È utilizzato quando un oggetto rappresenta una **risorsa unica e condivisa** e la creazione di più istanze nelle varie classi porterebbe a comportamenti incoerenti o errori.

---
### STRUTTURA E IMPLEMENTAZIONE

Un Singleton in Java si basa su tre elementi chiave:

- **Costruttore privato:** impedisce la creazione di istanze dall’esterno con `new`.
- **Riferimento statico all’istanza:** memorizza l’unica istanza della classe autonomamente.
- **Metodo statico pubblico:** fornisce l’accesso controllato all’istanza.

```java
public class Singleton {

    private Singleton() {
        // inizializzazione della risorsa
    }

    private static class Holder {
        private static final Singleton INSTANCE = new Singleton();
    }

    public static Singleton getInstance() {
        return Holder.INSTANCE;
    }
}
```

**Initialization on-demand:**

- inizializzazione _lazy_ (l’istanza è creata solo se necessaria)
- [[Multithreading|thread-safe]] grazie al class loading di Java
- nessun [[Overhead|overhead]] di sincronizzazione

---
### ESEMPIO DI UTILIZZO

In un’applicazione con molte classi è necessario un **logger unico** che: scriva su un solo file, mantenga una configurazione coerente, eviti conflitti tra istanze multiple. Il logger è quindi un candidato naturale per il Singleton:

```java
public class Logger {

    private Logger() {
        // configurazione del logger
    }

    private static class Holder {
        private static final Logger INSTANCE = new Logger();
    }

    public static Logger getInstance() {
        return Holder.INSTANCE;
    }

    public void log(String message) {
        System.out.println(message); // esempio semplificato
    }
}
```

Utilizzo nelle classi:

```java
public class UserService {
    public void createUser() {
        Logger.getInstance().log("LOG: Utente creato");
    }
}

public class OrderService {
    public void createOrder() {
        Logger.getInstance().log("LOG: Ordine creato");
    }
}
```

Tutte le classi utilizzano **la stessa istanza di Logger**, garantendo:

- comportamento coerente
- gestione centralizzata della risorsa
- riduzione del consumo di risorse

---
