// load the http module
const http = require('http');
const process = require('process')

// configure our HTTP server
const server = http.createServer(function (request, response) {
  response.writeHead(200, {"Content-Type": "text/plain"});
  response.end("Hello World!!!", process.env.MESSAGES);
});

// listen on localhost:8000
server.listen(8000);
console.log("Server listening at http://127.0.0.1:8000/");