/**
 * Created by techmaster on 11/26/14.
 */
/*process.on('exit', function(code) {
    // do *NOT* do this
    setTimeout(function() {
        console.log('This will not run');
    }, 0);
    console.log('About to exit with code:', code);
});*/

// Start reading from stdin so we don't exit.
/*process.stdin.resume();

process.on('SIGINT', function() {
    console.log('Got SIGINT.  Press Control-D to exit.');
});*/
console.log("Hoc Node JS khong kho");
console.log(__dirname);
console.log(__filename);