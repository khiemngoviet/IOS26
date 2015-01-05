/**
 * Created by techmaster on 11/26/14.
 */
const fs = require('fs');
const stream = fs.createReadStream('/etc/passwd');

stream.on('data', function(chunk) {
    process.stdout.write(chunk);
});

stream.on('error', function(err) {
        process.stderr.write("ERROR: " + err.message + "\n");
});