const url = 'https://api.thecatapi.com/v1/images/search?api_key=live_SnLo7nl0sKsh8eWcKxmXSzUkxJxmxz4sZ42qVwmFKtBfvx6egrBeaxPJl3jCbxoK&order=random';

// fetch(url)
//   .then(response => response.json())
//   .then(data => {
//     const imageUrl = data[0].url;
//     console.log(imageUrl);
//     document.getElementById("cat-img").src = data.image;
//   })
//   .catch(error => console.error(error));

const catImage = document.getElementById('cat-image');
const newImageButton = document.getElementById('new-image-button');

function fetchCatImage() {
  fetch(url)
    .then(response => response.json())
    .then(data => {
      const imageUrl = data[0].url;
      catImage.setAttribute('src', imageUrl);
    })
    .catch(error => console.error(error));
}

newImageButton.addEventListener('click', fetchCatImage);

// Fetch a cat image when the page loads
fetchCatImage();

//Nothing yet!
//See if the browser supports Service Workers, if so try to register one
if("serviceWorker" in navigator){
  navigator.serviceWorker.register("service-worker.js").then(function(registering){
    // Registration was successful
    console.log("Browser: Service Worker registration is successful with the scope",registering.scope);
  }).catch(function(error){
    //The registration of the service worker failed
    console.log("Browser: Service Worker registration failed with the error",error);
  });
} else {
  //The registration of the service worker failed
  console.log("Browser: I don't support Service Workers :(");
}
