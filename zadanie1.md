> <h1>Budowa obrazu</h1>
> <strong> docker build -f Dockerfile -t projekt_obraz . </strong>
> ![](./screeny/budowa_obrazu.png)

> <h1> Uruchomienie kontenera </h1>
> docker run -d -p 8000:80 --name projekt_kontener projekt_obraz
> ![](./screeny/uruchomienie_kontenera.png)

> <h1> Aplikacja </h1>
> ![](./screemy/aplikacja.png)

> <h1> Pozyskanie logów wygenerowanych podczas uruchomienia kontenera </h1>
> docker logs projekt_kontener
> ![](./screeny/sprawdzenie_logow.png)

> <h1> Sprawdzenie ilości warstw utworzonego obrazu </h1>
> docker history projekt_obraz
> ![](./screeny/ilosc_warstw.png)

> <h1> Analiza podatności utworzonego obrazu na zagrożenia </h1>
> docker scout quickview projekt_obraz
> ![](./screeny/)
