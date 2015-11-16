var socket = io.connect('http://localhost:8080');
var socketId = '';
var userOnOff = '';
$(document).ready(function() {
    $("#sendMessage").bind("click", function() {
        var id = '';
        var roomId = '';
        // Ajax call for saving datas
        var valuesToSubmit = $('#form-chat form').serialize();
        if ($("#content_message").val()) {
            $.ajax({
                type: "POST",
                async: false,
                url: $('#form-chat form').attr('action'), //sumbits it to the given url of the form
                data: {
                    group: $(this).attr('data-group'),
                    ip: $('.post-commnent .form-group .ip-user').val(),
                    contentMessage: $('.post-commnent .form-group .form-contro').val(),
                    _token: AUTH_TOKEN
                },
                dataType: "JSON" // you want a difference between normal and ajax-calls, and json is standard
            }).success(function(json) {
                id = json['id'];
                roomId = json['roomId'];
            });
            // put data to server nodejs
            $("#content_message").val('');
            socket.emit('data', {
                roomId: roomId,
                messagerId: id,
            });
            return false;
        }
    });
});

socket.on('data', function(data) {
    var dataAppend = '';
    var userMessengerId = '';
    var mf = '';
    $.ajax({
        type: "POST",
        async: false,
        url: '/ajax/find_message', //sumbits it to the given url of the form
        data: {
            id: data.messagerId,
            ip: data.ip
        },
        dataType: "JSON" // you want a difference between normal and ajax-calls, and json is standard
    }).success(function(json) {
        addMessenger(data.messagerId, json['userMessengerId'], json['dataAppend']);
    });
})

socket.on('createRoom', function(data) {
    // console.log(data.rooms);
})

socket.on('online', function(data) {
    socketId = data.socketId;
    createSocket(data.ip,data.socketId)
})

socket.on('pushOnOff', function(data) {
    turnOnOff(data.userId,data.status);
})

function createRoom(id) {
    socket.emit('createRoom', {
        roomId: id,
    });
}

function pushOnOff(id,onOff) {
    socket.emit('pushOnOff', {
        userId: id,
        status: onOff
    });
}

