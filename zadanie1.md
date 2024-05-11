> <h1>Budowa obrazu</h1>
> docker build -f Dockerfile -t projekt_obraz . <br>
![](/screeny/budowa.png)

> <h1> Uruchomienie kontenera </h1>
> docker run -d -p 8000:80 --name projekt_kontener projekt_obraz <br>
![](/screeny/kontener.png)

> <h1> Aplikacja </h1>
![](/screeny/aplikacja.png)

> <h1> Pozyskanie logów wygenerowanych podczas uruchomienia kontenera </h1>
> docker logs projekt_kontener <br>
![](/screeny/sprawdzenie_logow.png)

> <h1> Sprawdzenie ilości warstw utworzonego obrazu </h1>
> docker history projekt_obraz <br>
![](/screeny/warstwy.png)

> <h1> Analiza podatności utworzonego obrazu na zagrożenia </h1>
> Sprawdzenie poprawności odbyło sie na systemie Fedora, z uwagi na problemy z usługą Docker Scout w systemie Windows.
> docker scout quickview projekt_obraz <br>
![](/screeny/docker_scout.png)
