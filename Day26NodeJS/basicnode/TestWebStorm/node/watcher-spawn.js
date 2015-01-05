/*
 * Created by techmaster on 11/24/14.
 * Note.js the right way
 * Chú ý phải dùng --harmony để chạy chức năng mới nhất của ECMA Script
 * node --harmony watcher-spawn.js target.txt
 */
"use strict";
const
    fs = require('fs'),
    spawn = require('child_process').spawn,
    filename = process.argv[2];

if (!filename) {
    throw Error("A file to watch must be specified!");
}
fs.watch(filename, function() {
    let ls = spawn('ls', ['-lh', filename]);
    ls.stdout.pipe(process.stdout);
});
console.log("Now watching " + filename + " for changes...");