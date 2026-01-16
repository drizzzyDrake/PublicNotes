**Stream** in Java è un’interfaccia **contenuta nel [[Packages|package]] `java.util`** che permette di **elaborare sequenze di dati in modo dichiarativo e funzionale**. Uno Stream **non memorizza elementi**; opera su sorgenti dati come [[Collection]], [[MDP/Types/Arrays|array]] o generatori, descrivendo **una pipeline di operazioni**. Lo Stream separa il _cosa fare_ dai dettagli di implementazione del _come iterare_, permettendo trasformazioni, filtraggio, aggregazioni e parallelizzazione senza mutare la sorgente.

---
### TIPI DI STREAM

Java definisce principalmente tre tipologie di Stream:

|Tipo|Descrizione|
|---|---|
|`Stream<T>`|Per riferimenti a oggetti generici|
|`IntStream`|Per valori primitivi `int`|
|`LongStream`|Per valori primitivi `long`|
|`DoubleStream`|Per valori primitivi `double`|

> N.B. i tipi primitivi permettono di evitare il [[Autoboxing|boxing]] automatico e aumentare le prestazioni.

---
### CREAZIONE DI UNO STREAM

Gli Stream non si istanziano direttamente con `new`. Si ottengono tramite **metodi di fabbrica**:

```java
List<Integer> numbers = List.of(1,2,3,4,5);
Stream<Integer> s1 = numbers.stream();           // Stream sequenziale
Stream<Integer> s2 = numbers.parallelStream();   // Stream parallelo

String[] array = {"a","b","c"};
Stream<String> s3 = Arrays.stream(array);        // Stream da array
```

---
### OPERAZIONI SUGLI STREAM

Uno Stream utilizza **pipeline di operazioni**, divise in due categorie:

---
#### Operazioni intermedie (lazy)

- Restituiscono un nuovo Stream
- Non eseguono subito il calcolo
- Esempi: `filter`, `map`, `flatMap`, `distinct`, `sorted`, `limit`

```java
Stream<Integer> evenSquares =
    numbers.stream()
           .filter(n -> n % 2 == 0)  // operazione intermedia
           .map(n -> n * n);         // operazione intermedia
           .toList()                 // operazione terminale
```

---
#### Operazioni terminali

- Consumano lo Stream e producono un risultato
- Esempi: `toList`, `forEach`, `collect`, `reduce`, `count`, `anyMatch`, `allMatch`

```java
List<Integer> result = evenSquares.toList();    
```

In questo caso `toList` accumula gli elementi in una lista `result`.

---
##### Collectors

`Collectors` permette di **accumulare i risultati in collezioni, mappe o stringhe** tramite `collect`:

```java
Map<String, List<Person>> grouped =
    people.stream()
          .collect(Collectors.groupingBy(Person::getCity));
```

---
### ESEMPI DI USO

**Filtrare e trasformare una lista:**

```java
List<Integer> numbers = List.of(1,2,3,4,5,6);
List<Integer> squares =
    numbers.stream()
           .filter(n -> n > 3)
           .map(n -> n * n)
           .toList();

System.out.println(squares); // [16, 25, 36]
```

**Flatten di liste annidate:**

```java
List<List<String>> listOfLists = List.of(
    List.of("a","b"),
    List.of("c","d")
);

List<String> flatList = listOfLists.stream()
                                   .flatMap(List::stream)
                                   .toList();

System.out.println(flatList); // [a, b, c, d]
```

---
### STREAM PARALLELI

Gli **Stream paralleli** (`parallelStream()`) in Java sono **uno strumento per eseguire le pipeline di uno Stream in più [[Multithreading|thread]] contemporaneamente**, sfruttando il **multi-core della CPU**, senza dover gestire esplicitamente i thread.

---
#### Funzionamento

Normalmente uno Stream è **sequenziale**:

```java
List<Integer> numbers = List.of(1,2,3,4,5,6);
numbers.stream()                   // sequenziale
       .filter(n -> n % 2 == 0)
       .map(n -> n * n)
       .forEach(System.out::println);
```

Tutte le operazioni avvengono **su un singolo thread** e l'ordine degli elementi è **garantito**. 
Per renderlo **parallelo**, basta usare `parallelStream()`:

```java
List<Integer> numbers = List.of(1,2,3,4,5,6);
numbers.parallelStream()           // parallelo
       .filter(n -> n % 2 == 0)
       .map(n -> n * n)
       .forEach(System.out::println);
```

Java divide i dati in **più blocchi** e ogni blocco viene elaborato **contemporaneamente** su thread diversi. Operazioni intermedie (`filter`, `map`, `sorted`) vengono applicate in parallelo.

---
