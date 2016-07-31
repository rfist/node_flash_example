var app = require('express')();
var http = require('http').Server(app);
var io = require('socket.io')(http);
var locator = require('./locator');

io.on('connection', function (socket) {
    console.log("user connected");
    socket.on('disconnect', function(){
        console.log('user disconnected');
    });
    socket.on('get_position', function(data) {
        var leftUpPosition, rightDownPosition;
        if (data.hasOwnProperty('leftUpPosition')) {
            leftUpPosition = data.leftUpPosition;
        }
        if (data.hasOwnProperty('rightDownPosition')) {
            rightDownPosition = data.rightDownPosition;
        }
        if (leftUpPosition && rightDownPosition) {
            var newPosition = locator.getRandomPosition(leftUpPosition, rightDownPosition);
            io.sockets.sockets[socket.id].emit("server_message", {newPosition: newPosition});
        } else {
            io.sockets.sockets[socket.id].emit("server_message", {server_error: "Invalid input positions"});
        }
    });
    socket.on('server_check', function() {
        io.sockets.sockets[socket.id].emit("server_message", {server_check: "ready"});
    });

});

http.listen(3000, function(){
    console.log('listening on *:3000');
});

