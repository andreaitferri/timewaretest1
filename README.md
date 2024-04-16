# timewaretest1

Un progetto Flutter che sfrutta l'architettura Pine per fornire un approccio strutturato e scalabile allo sviluppo di applicazioni.

## Introduzione

Questo progetto è un punto di partenza per un'applicazione Flutter che utilizza l'architettura Pine, integrando concetti di separazione chiara delle responsabilità e sviluppo modulare.

### Architettura

Il progetto utilizza l'**architettura Pine**, che si concentra sul mantenimento di una struttura pulita e gestibile che separa le presentazioni, la logica di business e i dati:

- **Data Transfer Objects (DTO)**: Nell'architettura dell'app, i DTO sono utilizzati per incapsulare i dati scambiati tra il livello di servizio e altre parti dell'applicazione. Questo approccio consente una chiara separazione tra la struttura dei dati come vengono recuperati dalle API (`SpeciesDTO`, `DetailedSpeciesDTO`) e il loro utilizzo all'interno dell'app. I DTO aiutano a mantenere il codice pulito, organizzato e più facile da gestire, riducendo la complessità e migliorando la manutenibilità.

**Repository**: Il pattern Repository viene utilizzato per incapsulare la logica di accesso ai dati, agendo da mediatore tra il dominio dell'applicazione e le fonti di dati o i livelli di servizio. Questo strato astrae la logica di accesso ai dati, fornendo un'interfaccia più semplice per l'accesso e la manipolazione dei dati. Ad esempio, `SpeciesRepository` gestisce le interazioni con `SpeciesService` e `DetailedSpeciesService`, incapsulando la logica per il recupero e la trasformazione dei dati in modelli utilizzabili dall'applicazione.

- **Servizi**: Gestisce il recupero dei dati e la comunicazione con servizi esterni o API. In questo progetto, `SpeciesService` e `DetailedSpeciesService` sono esempi di classi di servizio che recuperano dati da API esterne.

- **Mapper**: Trasforma gli oggetti dati da una forma all'altra. È utile quando si convertono dati ricevuti da un'API (Data Transfer Objects o DTOs) in modelli adatti per l'uso nell'interfaccia utente. `SpeciesMapper` e `DetailedSpeciesMapper` sono utilizzati qui per mappare DTOs in oggetti modello.

- **Provider e Bloc**: Utilizzati per la gestione dello stato e per separare la logica di business dai componenti dell'interfaccia utente. Questo progetto utilizza `SpeciesBloc` e `DetailedSpeciesBloc` per gestire e propagare i cambiamenti nello stato dell'applicazione in base alle interazioni dell'utente e ai cambiamenti nei dati.

### Vantaggi dell'architettura Pine

1. **Separazione delle responsabilità**: Dividendo l'applicazione in strati distinti, è più facile gestire e aggiornare parti specifiche del codice senza influenzare le altre.

2. **Riutilizzabilità**: Componenti come servizi e mapper possono essere facilmente riutilizzati in diverse parti dell'applicazione o anche in altri progetti.

3. **Scalabilità**: Questa architettura supporta l'espansione dell'applicazione aggiungendo nuove funzionalità o strati senza dover rielaborare significativamente.

4. **Manutenibilità**: Ogni componente ha una chiara responsabilità, rendendo il codice più facile da comprendere e mantenere.

5. **Testabilità**: Con una chiara separazione, diventa più facile implementare test unitari e di integrazione per ciascun componente dell'applicazione.

## Init app

Nel file  app.dart non è stato trasformato usando l'estensione pine e il suo costrutto "DependencyInjector" per lasciare piu' visibile la struttura, la separazione, sono stati usati MultiRepositoryProvider, anche se è presente un solo repository (per comodità) sotto viene specificato l'uso delle rotte da come richiesto

## Dettagli Implementativi e Scelte Architetturali

### Gestione dei Bloc

I Bloc non sono stati iniettati direttamente nel alberto dei widget per limitare la loro visibilità esclusivamente agli scaffold dove vengono utilizzati.
In caso di necessità, è possibile centralizzare i Bloc nel file `app.dart` per condividere lo stato più facilmente tra più parti dell'applicazione.

### Layout Adattivi

Il layout dell'applicazione è stato progettato per essere adattivo, distinguendo tra visualizzazioni su dispositivi mobili, tablet e web. Si utilizzano layout differenti in base alla dimensione dello schermo per migliorare l'esperienza utente su ciascun dispositivo. Questa flessibilità nel design assicura che l'applicazione sia fruibile in modo ottimale su una vasta gamma di dispositivi.

### Gestione delle API

Le API utilizzate per il progetto sono state create personalmente, in quanto quella segnalata da voi aveva problemi con  la generazione di token di autenticazione. (https://apiv3.iucnredlist.org/api/v3/token)
Questo ha anche limitato la possibilità di mostrare le informazioni in un modo esteticamente corretto, e di mettere in risalto le informazioni salienti  non sapendo quali dati avrei ricevuto dall'api originali

### Gestione Errori 

L'applicazione utilizza classi di errore personalizzate (`NetworkError` e `RepositoryError`) per una gestione strutturata e chiara degli errori di rete e di repository. Questo approccio migliora la leggibilità, il debugging, e la consistenza nell'handling degli errori, incrementando la resilienza e l'affidabilità dell'applicazione.
