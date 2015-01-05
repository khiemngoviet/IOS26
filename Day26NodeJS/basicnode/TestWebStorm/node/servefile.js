/**
 * Created by techmaster on 11/24/14.
 */
const http = require('http');
const fs = require('fs');
const server = http.createServer();
server.on('request', function(req, res){
    res.writeHead(200, {'Content-Type': 'image/jpg'});
    fs.createReadStream('./playboy.jpg').pipe(res);
});
server.listen(3000);
console.log('Serve play boy at http://localhost:3000');