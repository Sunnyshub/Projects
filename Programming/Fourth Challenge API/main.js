        // THis is the source of the api
        fetch ('https://rickandmortyapi.com/api/character/2')
            .then(response => response.json())
            .then(data => {
                const dataDiv = document.getElementById('data');
                dataDiv.textContent = JSON.stringify(data);

                // This changes the html in my page so it's visible whenever the api is shown
                document.getElementById("data").textContent = data.name;
                document.getElementById("type").textContent = data.type;
                document.getElementById("gender").textContent = data.gender;
                document.getElementById("char-name").src = data.image;
            })
            .catch(error => console.error(error))
