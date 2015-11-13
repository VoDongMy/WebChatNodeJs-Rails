var socket = require('socket.io');
var express = require('express');
var http = require('http');
var app = express();
var server = http.createServer(app);
var io = socket.listen(server);

require('./routes')(app, io);
io.sockets.on('connection', function(client) {
    console.log("New client ! ");
    console.log("ip:  " + client.request.connection.remoteAddress);

    io.sockets.in(client.id).emit('online',{
	        ip: client.request.connection.remoteAddress,
	        socketId: client.id
        });

    client.on('data', function(data) {
    	console.log(data.roomId);
    	if (data.roomId != 'nil'){
    		console.log('sending: '+data.roomId);
        	io.sockets.in(data.roomId).emit('data',{
	        ip: client.request.connection.remoteAddress,
	        messagerId: data.messagerId
        });
    	} else{
    		io.sockets.emit('data', {
	        ip: client.request.connection.remoteAddress,
	        messagerId: data.messagerId
        	});
        	console.log(data.messagerId);
    	}
    });

    client.on('createRoom', function(data) {
        client.join(data.roomId);
        io.sockets.emit('createRoom', {
	        rooms: io.sockets.adapter.rooms
        });
    });

    client.on('chatRoom', function(data) {
        broadcast.to(data.roomId).emit('data',{
            ip: client.request.connection.remoteAddress,
            messagerId: data.messagerId
        });
    });

    client.on('pushOnOff', function(data) {
    	io.sockets.emit('pushOnOff', {
            userId: data.userId,
            status: data.status
        });
    });

    client.on("disconnect", function () {
        console.log("out client ! ");
    });

});
server.listen(8080);

