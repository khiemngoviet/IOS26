/**
 * Created by techmaster on 11/22/14.
 */
var canvas = document.getElementById('canvas'), context = canvas.getContext('2d');
context.font = '38 pt Arial';
context.fillStyle = 'cornflowerblue';
context.strokeStyle = 'blue';

context.fillText('Hello Canvas', canvas.width/2 -150, canvas.height/2 + 150);
context.strokeText('Hello Canvas',  canvas.width/2 -150, canvas.height/2 + 15);

