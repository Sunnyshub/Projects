document.querySelector("button").addEventListener("click", () => {

      console.log("Requesting our API");
    
    fetch("http://127.0.0.1:3000/").then((response)=>{
        response.text().then((text)=>{
            document.querySelector("body").innerHTML+=`<h1>${text}</h1>`
        })
    });
    
      console.log("End of JavaScript");
    
    });