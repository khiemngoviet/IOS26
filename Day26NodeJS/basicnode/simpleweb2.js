const http = require('http');
const server = http.createServer();

server.on('request', function(req, res) {
    res.writeHead(200, {'Content-Type': 'text/plain'});
    res.end('Hello World\n');
});

server.listen(3000);
console.log('Server is running at http://localhost:3000');
