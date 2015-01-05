/**
 * Created by techmaster on 11/25/14.
 * If you want the root of your module's export to be a function (such as a constructor) or
 * if you want to export a complete object in one assignment instead of building it one property
 * at a time, assign it to module.exports instead of exports.
 */
var square = require('./square.js');
var mySquare = square(2);
console.log('The area of my square is ' + mySquare.area());