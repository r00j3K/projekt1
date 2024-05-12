<h1 align="center"> !!!!! <br> Zadanie obowiązakowe zostało wykonane w oparciu o plik Dockerfile, natomiast zadanie nieobowiązkowe w oparciu o Dockerfile2 <br> !!!!! </h1>

<h1 align="center"> Zadanie obowiązkowe </h1>

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

<h1 align="center"> Zadanie nieobowiązkowe </h1>

> <h1> Stworzenie builder'a  </h1>
> docker buildx create --name projekt_builder --driver docker-container --bootstrap --use <strong> - utworzenie dedykowanego buildera w kontenerze o nazwie projekt_builder, uruchomienie go i ustawienie go jako domyślnego buildera </strong>
![](/screeny_dod/customowy_builder.png)

> <h1> Budowa obrazu (bez cache'a) </h1>
> docker buildx build -f Dockerfile2 -t docker.io/adrianrojek01/nowy_projekt1:v0 --ssh default=$SSH_AUTH_SOCK --platform linux/arm64,linux/amd64 --cache-from=type=registry,ref=docker.io/adrianrojek01/nowy_projekt1:cache --cache-to=type=registry,ref=docker.io/adrianrojek01/nowy_projekt1:cache,mode=max --push . <strong> - budowa obrazu na podstawie Dockerfile2, dodanie autentykacji ssh niezbędnej do wykorzystania w procesie budowy plików znajdujących się na repozytorium GitHub, wykorzystanie budowy multiplatformowej, wykorzystanie cache'a znajdującego się na DockerHub'ie, eksport cache'a na DockerHub'a, przesłanie obrazu na DockerHuba </strong>
> 
>> Jak można zauważyć na screen'ie umieszczonym poniżej nie udało się wykorzystać cache'a w procesie budowy. Wynika to z faktu, iż obraz nie był wcześniej budowany, dlatego na repozytorium nie znajduje się jeszcze żaden cache z procesu budowy.

![](/screeny_dod/budwoa_obrazu_bez_cache.png)

> <h1> Pobranie obrazu z repozytorium DockerHub </h1>
![](/screeny_dod/pobranie_obrazu.png)

> <h1> Uruchomienie kontenera </h1>
> docker run -d -p 8000:80 --name projekt_zmodyfikowany adrianrojek01/nowy_projekt1:v0
![](/screeny_dod/uruchomienie_kontenera_mod.png)

> <h1> Działająca aplikacja </h1>
![](/screeny_dod/aplikacja_zmodyfikowana.png)

> <h1> Budowa obrazu przy wykorzystaniu cache'a </h1>
> Wykorzystane zostało to samo polecenie co wcześniej, jednak teraz można zauważyć, że podczas budowy użyty został cache, co znacznie przyspieszyło cały proces.
![](/screeny_dod/budowa_z_cachem.png)
