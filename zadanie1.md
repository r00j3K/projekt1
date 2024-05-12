<h1 align="center">Budowa obrazu</h1>

```
bash docker build -f Dockerfile -t projekt_obraz .
```

![](/screeny/budowa.png)

<h1 align="center"> Uruchomienie kontenera </h1>

```
bash docker run -d -p 8000:80 --name projekt_kontener projekt_obraz
```

![](/screeny/kontener.png)

<h1 align="center"> Aplikacja </h1>

![](/screeny/aplikacja.png)

<h1 align="center"> Pozyskanie logów wygenerowanych podczas uruchomienia kontenera </h1>

``` 
bash docker logs projekt_kontener
```

![](/screeny/sprawdzenie_logow.png)

<h1 align="center"> Sprawdzenie ilości warstw utworzonego obrazu </h1>

```
bash docker history projekt_obraz
```

![](/screeny/warstwy.png)

<h1 align="center"> Analiza podatności utworzonego obrazu na zagrożenia </h1>

<strong> Sprawdzenie poprawności odbyło sie na systemie Fedora, z uwagi na problemy z usługą Docker Scout w systemie Windows. </strong>

```
bash docker scout quickview projekt_obraz
```

![](/screeny/docker_scout.png)
