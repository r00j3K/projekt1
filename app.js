const express = require('express');
const app = express();

//ustawienie portu
const port = 80;
//ustawienie autora
const user = "Adrian Rojek";
//ustawienie daty
const currentDate = new Date();

app.get('/', async (req, res) => {
    try {
        //importowanie modułu node-fetch
        const fetchModule = await import('node-fetch');
        //uzyskanie dostępu do modułu
        const fetch = fetchModule.default; 
        //pobranie informacji o użytkowniku
        const response = await fetch("http://ip-api.com/json/");
        //zwrócenie pobranych danych w formacie JSON
        const data = await response.json();
        //wyodrębnienie informacji o ip
        const ip = data.query;
        //pobranie daty na podstawie strefy czasowej użytkownika
        const dateAndTime = new Date().toLocaleString('pl-PL', {timeZone: data.timezone} );
        //wysłanie odpowiedzi z niezbędnymi informacjami
        res.send(`
            <h1> Twoje ip: ${ip} <h1>
            <h1> Twój aktualny czas i data: ${dateAndTime} </h1>
        `);
    }
    catch(err){
        console.log("Error: "+err);
    }
});

//wyświetlenie niezbędnych informacji w logach
app.listen(port, () => {
    console.log(`Data uruchomienia: ${currentDate}\nAutor: ${user}\nPort: ${port}`);
})