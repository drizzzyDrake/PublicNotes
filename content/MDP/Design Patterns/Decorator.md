Il **Decorator** è uno **[[Design Pattern#Structural patterns|structural design pattern]]** che consente di **aggiungere dinamicamente nuove funzionalità a un oggetto**, senza modificare la sua classe. Si basa sulla **composizione** anziché sull’ereditarietà ed è utile quando si vogliono combinare comportamenti in modo flessibile. Il Decorator “avvolge” un oggetto e intercetta le chiamate, aggiungendo comportamento prima o dopo quello originale.

---
### STRUTTURA E IMPLEMENTAZIONE

Il pattern coinvolge quattro ruoli:

- **Component:** interfaccia comune per oggetti base e decoratori
- **ConcreteComponent:** oggetto di base a cui aggiungere funzionalità
- **Decorator:** classe astratta che mantiene un riferimento a un `Component`
- **ConcreteDecorator:** aggiunge il nuovo comportamento

**Component:**

```java
public interface Notifier {
    void send(String message);
}
```

**ConcreteComponent:**

```java
public class EmailNotifier implements Notifier {
    public void send(String message) {
        System.out.println("Invio email: " + message);
    }
}
```

**Decorator:**

```java
public abstract class NotifierDecorator implements Notifier {

    protected Notifier wrappee;

    protected NotifierDecorator(Notifier notifier) {
        this.wrappee = notifier;
    }

    public void send(String message) {
        wrappee.send(message);
    }
}
```

**ConcreteDecorators:**

```java
public class SmsDecorator extends NotifierDecorator {

    public SmsDecorator(Notifier notifier) {
        super(notifier);
    }

    public void send(String message) {
        super.send(message);
        sendSms(message);
    }

    private void sendSms(String message) {
        System.out.println("Invio SMS: " + message);
    }
}
```

```java
public class SlackDecorator extends NotifierDecorator {

    public SlackDecorator(Notifier notifier) {
        super(notifier);
    }

    public void send(String message) {
        super.send(message);
        sendSlack(message);
    }

    private void sendSlack(String message) {
        System.out.println("Invio messaggio Slack: " + message);
    }
}
```

---
### ESEMPIO DI UTILIZZO

```java
public class Client {
    public static void main(String[] args) {
        Notifier notifier =
            new SlackDecorator(
                new SmsDecorator(
                    new EmailNotifier()
                )
            );

        notifier.send("è morto il Puma");
    }
}
```

**Output concettuale:**

```
Invio email: è morto il Puma
Invio SMS: è morto il Puma
Invio messaggio Slack: è morto il Puma
```

---
