L’**Observer** è un **[[Design Pattern#Behavioral patterns|behavioral design pattern]]** che definisce una **relazione uno-a-molti** tra oggetti, tale per cui quando un oggetto (il Subject) cambia stato, **tutti i suoi osservatori (Observers) vengono notificati automaticamente**. Il pattern permette di **disaccoppiare** il Subject dagli oggetti che dipendono da esso: il Subject non conosce i dettagli concreti degli Observer.

---
### STRUTTURA E IMPLEMENTAZIONE

Il pattern coinvolge quattro ruoli principali:

- **Subject:** mantiene la lista degli osservatori e fornisce metodi di registrazione
- **ConcreteSubject:** contiene lo stato osservato e notifica i cambiamenti
- **Observer:** interfaccia che definisce il metodo di aggiornamento
- **ConcreteObserver:** reagisce ai cambiamenti del Subject

**Observer:**

```java
public interface Observer {
    void update(int state);
}
```

**Subject:**

```java
import java.util.ArrayList;
import java.util.List;

public abstract class Subject {

    protected List<Observer> observers = new ArrayList<>();

    public void attach(Observer o) {
        observers.add(o);
    }

    public void detach(Observer o) {
        observers.remove(o);
    }

    protected void notifyObservers(int state) {
        for (Observer o : observers) {
            o.update(state);
        }
    }
}
```

**ConcreteSubject:**

```java
public class TemperatureSensor extends Subject {

    private int temperature;

    public void setTemperature(int temperature) {
        this.temperature = temperature;
        notifyObservers(temperature);
    }
}
```

**ConcreteObserver:**

```java
public class Display implements Observer {

    private String name;

    public Display(String name) {
        this.name = name;
    }

    public void update(int state) {
        System.out.println(
            name + " - Temperatura aggiornata: " + state + "°C"
        );
    }
}
```

---
### ESEMPIO DI UTILIZZO

```java
public class Client {
    public static void main(String[] args) {

        TemperatureSensor sensor = new TemperatureSensor();

        Observer display1 = new Display("Display 1");
        Observer display2 = new Display("Display 2");

        sensor.attach(display1);
        sensor.attach(display2);

        sensor.setTemperature(25);
        sensor.setTemperature(30);
    }
}
```

**Output concettuale:**

```
Display 1 - Temperatura aggiornata: 25°C
Display 2 - Temperatura aggiornata: 25°C
Display 1 - Temperatura aggiornata: 30°C
Display 2 - Temperatura aggiornata: 30°C
```

---
