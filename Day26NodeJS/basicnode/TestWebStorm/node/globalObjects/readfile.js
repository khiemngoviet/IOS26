/**
 * Created by techmaster on 11/26/14.
 */
const fs = require('fs')
fs.readFile('/etc/passwd', function (err, data) {
    if (err) throw err;
    console.log(data);
});