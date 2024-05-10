#Etap 1

#budowanie obrazu od podstaw
FROM scratch as first_stage
#ustawienie katalogu roboczego
WORKDIR /home/
#dodanie systemu plików do obrazu
ADD alpine-minirootfs-3.19.1-x86_64.tar /

#aktualizacja, instalacja niezbędnych pakietów i czyszczenie cache'a
RUN apk update && \
    apk add nodejs npm && \
    rm -rf /var/cache/apk/*

#kopiowanie aplikacji i pliku z zależnościami do wnętrza obrazu
COPY app.js package.json ./

#instalacja zależności zdefiniowanych w "package.json"
RUN npm install


#Etap 2
#budowanie obrazu na podstaiwee
FROM alpine:latest
#ustawienie autora
LABEL maintainer="Adrian Rojek"
#ustawienie katalogu roboczego
WORKDIR /home/

#aktualizacja, instalacja nodejs i czyszczenie cache'a
RUN apk update && \
    apk add nodejs curl && \
    rm -rf /var/cache/apk/*

#skopiowanie pliku aplikacji oraz niezbędnych do jej działania modułów z pierwszego etapu do katalogu roboczego obrazu "właściwego"
COPY --from=first_stage /home/ ./

#uruchomienie aplikacji
CMD node app.js

#wystawienie portu 80 do użytku na zewnątrz kontenera
EXPOSE 80

#przeprowadzenie testu poprawności działania kontenera
HEALTHCHECK --interval=15s --timeout=1s \
    CMD curl -f http://localhost:80





