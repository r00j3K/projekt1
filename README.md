<h1 align="center"> !!!!! <br> Zadanie obowiązakowe zostało wykonane w oparciu o plik Dockerfile, natomiast zadanie nieobowiązkowe w oparciu o Dockerfile2 <br> !!!!! </h1>

<h1 align="center"> Zadanie obowiązkowe </h1>

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

<h1 align="center"> Zadanie nieobowiązkowe </h1>

<h1 align="center"> Stworzenie builder'a  </h1>

```
bash docker buildx create --name projekt_builder --driver docker-container --bootstrap --use 
```
 <strong> Utworzenie dedykowanego buildera w kontenerze o nazwie projekt_builder, uruchomienie go i ustawienie go jako domyślnego buildera </strong>

![](/screeny_dod/customowy_builder.png)

<h1 align="center"> Budowa obrazu (bez cache'a) </h1>

```
bash docker buildx build -f Dockerfile2 -t docker.io/adrianrojek01/nowy_projekt1:v0 --ssh default=$SSH_AUTH_SOCK --platform linux/arm64,linux/amd64 --cache-from=type=registry,ref=docker.io/adrianrojek01/nowy_projekt1:cache --cache-to=type=registry,ref=docker.io/adrianrojek01/nowy_projekt1:cache,mode=max --push .
```

> <strong> Budowa obrazu na podstawie Dockerfile2, dodanie autentykacji ssh niezbędnej do wykorzystania w procesie budowy plików znajdujących się na repozytorium GitHub, wykorzystanie budowy multiplatformowej, wykorzystanie cache'a znajdującego się na DockerHub'ie, eksport cache'a na DockerHub'a, przesłanie obrazu na DockerHuba </strong>
>
>> Jak można zauważyć na screen'ie umieszczonym poniżej nie udało się wykorzystać cache'a w procesie budowy. Wynika to z faktu, iż obraz nie był wcześniej budowany, dlatego na repozytorium nie znajduje się jeszcze żaden cache z procesu budowy.

![](/screeny_dod/budwoa_obrazu_bez_cache.png)

<h1 align="center"> Pobranie obrazu z repozytorium DockerHub </h1>

![](/screeny_dod/pobranie_obrazu.png)

<h1 align="center"> Uruchomienie kontenera </h1>

```
bash docker run -d -p 8000:80 --name projekt_zmodyfikowany adrianrojek01/nowy_projekt1:v0
```

![](/screeny_dod/uruchomienie_kontenera_mod.png)

<h1 align="center"> Działająca aplikacja </h1>

![](/screeny_dod/aplikacja_zmodyfikowana.png)

<h1 align="center"> Budowa obrazu przy wykorzystaniu cache'a </h1>

<strong> Wykorzystane zostało to samo polecenie co wcześniej, jednak teraz można zauważyć, że podczas budowy użyty został cache, co znacznie przyspieszyło cały proces. </strong>

![](/screeny_dod/budowa_z_cachem.png)
