/**
 * Created by techmaster on 11/23/14.
 */
var http = require('http');
var url = require('url');

var server = http.createServer();

server.on('request', function(req, res) {
    var url_parsed = url.parse(req.url, true);
    if (req.method === 'GET') {
        handleGETRequest(res, url_parsed);
    }
});

server.listen(3000);

handleGETRequest = function(res, url_parsed) {
    console.log('path: ' + url_parsed.pathname);
    switch (url_parsed.pathname) {
        case "/":
            res.writeHead(200, {'Content-Type': 'text/plain'});
            res.end('Front page is here\n');
            break;
        case "/hi":
            res.writeHead(200, {'Content-Type': 'text/plain'});
            res.end('Hello World\n');
            break;
        case "/api":
            res.setHeader('Content-Type', 'application/json');
            res.writeHead(200, 'json content');
            res.write('{"spy_agent": "OX-13"}');
            res.end();
            break;
    }
};