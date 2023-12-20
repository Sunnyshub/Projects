const express = require('express');
const app = express()
const port = 3000;

const { MongoClient, ServerApiVersion } = require('mongodb');
const uri = "mongodb+srv://zonei:<password>@cluster0.gvpa8uq.mongodb.net/?retryWrites=true&w=majority";
// Create a MongoClient with a MongoClientOptions object to set the Stable API version
const client = new MongoClient(uri, {
  serverApi: {
    version: ServerApiVersion.v1,
    strict: true,
    deprecationErrors: true,
  }
});

client.connect().then(()=>{
  const sunny_db = client.db("Sunny_database")
  const sunny_coll = sunny_db.collection("Table1")
  console.log()

  app.use((request,response,next)=>{
    response.header("Access-Control-Allow-Origin", "*");
    response.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
    next();
  })
  
  app.get('/', (request, response) => {
    response.statusCode = 200;
    response.setHeader('Content-Type', 'text/plain');
    response.end('I got your GET request');
  })
  
  sunny_coll.findOne({height})

  app.listen(port, () => {
    console.log('Example app listening on port ${port}')
  })
})





// const hostname = '127.0.01.1';
// const port = 3000;

// const server = http.createServer((request, response) => {
  
//   console.log('A ${request.method} request came in on ${request.url}')

//   if(request.method=="GET"){
//     response.statusCode = 200;
//     response.setHeader('Content-Type', 'text/plain');
//     response.end('I got your GET request');
//   }else {
//     response.statusCode = 405;
//     response.setHeader('Content-Type', 'text/plain');
//     response.end('I got your GET request');
//   }
//   console.log(request)
// });

// server.listen(port, hostname, () => {
//   console.log(`Server running at http://${hostname}:${port}/`);
// });