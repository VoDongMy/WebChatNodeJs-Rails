$(document).ready(function() {
    // Menu Mobile
    $(".button-collapse").sideNav({
        'edge': 'left'
    });
    // Popup Clean and Sign out
    $('.modal-trigger').leanModal();
    // More button about comment
    $(".action-commnent a").click(function(event) {
        $(".post-commnent .form-group .form-group-inner-bottom").slideToggle(300);
        $(this).toggleClass("active");
        event.preventdefault();
    });
    // cfrs for ajax
    $(document).ajaxSend(function(event, request, settings) {
        if (typeof(AUTH_TOKEN) == "undefined") return;
        // settings.data is a serialized string like "foo=bar&baz=boink" (or null)
        settings.data = settings.data || "";
        settings.data += (settings.data ? "&" : "") + "authenticity_token=" + encodeURIComponent(AUTH_TOKEN);
    });
    // loading chat
    var userAuthFirst = 0;
    var html = '';
    var messsgeId = 0;
    $('#message-content .group-chat .item-chat').each(function() {
        if (userAuthFirst == $(this).attr('data-user-auth')) {
            html = jQuery(this).find(".box-main-comment").html();
            $('#message-content .group-chat').find('.messsge-' + messsgeId).append(html);
            $(this).html('')
        } else {
            userAuthFirst = $(this).attr('data-user-auth');
            jQuery(this).find(".box-main-comment").addClass('messsge-' + jQuery(this).attr('data-messenger'));
            messsgeId = jQuery(this).attr('data-messenger');
        };
        $('#message-content .group-chat').removeClass('wait-js')
    });
    //remove html class remove
    $('.list-user-chat .group-user li').remove('.remove');
    // add class on/off
    $('.list-user-chat .list-user .box-user-name .on-off').each(function() {
        if ($(this).text() == 'online') {
            jQuery(this).addClass('online');
        };
    });
    $('.list-user-chat .list-user .box-icon-user .new-chat').bind("click", function() {
        userChatPrivate($(this).attr('data-user'));
    });
    //active navi sidebar
    $('#slide-out li').bind("click", function() {
        $('#slide-out li').removeClass('active');
        $(this).addClass('active');
    });
    var liActive = $('main div.main-content').attr('data-active')
    if (liActive != 'undefined') $('#slide-out li[data-active = ' + liActive + ']').addClass('active');
    //create room server
    createRoomServer();
    //remove class wait js
    $('#message-content ul.group-chat').removeClass('wait-js');
    $(window).bind("beforeunload", function() {
        console.log(socketId);
        if (socketId != '' || socketId) {
            clearSocket(socketId)
        }
         // return 'Are you sure you want to leave?';
    });
});
//active navi sidebar
function activeNaviSidebar() {
    var liActive = $('main div.main-content').attr('data-active');
    if (liActive != 'undefined') {
        if ($('#slide-out li[data-active = ' + liActive + ']')) $('#slide-out li[data-active = ' + liActive + ']').addClass('active');
    } else {
        $('#slide-out li').removeClass('active')
    }
};
//click user chat private
function userChatPrivate(id) {
    $.ajax({
        type: "POST",
        url: '/ajax/create_chat_room', //sumbits it to the given url of the form
        data: {
            id: id,
            _token: AUTH_TOKEN
        },
        dataType: "JSON" // you want a difference between normal and ajax-calls, and json is standard
    }).success(function(json) {
        if (json['description']) {
            createRoom(json['description']);
        }
        window.location.href = json['location'];
    });
}
// clear soket
function clearSocket(socketId) {
    $.ajax({
        type: "POST",
        async: false,
        url: '/ajax/clear_socket', //sumbits it to the given url of the form
        data: {
            socketId: socketId,
            _token: AUTH_TOKEN
        },
        dataType: "JSON" // you want a difference between normal and ajax-calls, and json is standard
    }).success(function(json) {
        if (json['userOnOff'] == 0){
        pushOnOff(json['userId'], json['userOnOff']);
        }
        return json['userOnOff'];
    });
}
// clear soket
function createSocket(ip, socketId) {
    $.ajax({
        type: "POST",
        url: '/ajax/create_socket', //sumbits it to the given url of the form
        data: {
            socketId: socketId,
            ip: ip
        },
        dataType: "JSON" // you want a difference between normal and ajax-calls, and json is standard
    }).success(function(json) {
        pushOnOff(json['userId'], json['userOnOff']);
        return json['userOnOff'];
    });
}
//
function updateRoomServer(id) {
    $.ajax({
        type: "POST",
        url: '/ajax/update_chat_room_server', //sumbits it to the given url of the form
        data: {
            id: id,
            dataUpdate: {
                on_server: 1
            },
            _token: AUTH_TOKEN
        },
        dataType: "JSON" // you want a difference between normal and ajax-calls, and json is standard
    }).success(function(json) {
        return true
    });
}
//click user chat private
function createRoomServer() {
    $.ajax({
        type: "GET",
        url: '/ajax/get_chat_room_server', //sumbits it to the given url of the form
        data: {},
        dataType: "JSON" // you want a difference between normal and ajax-calls, and json is standard
    }).success(function(json) {
        if (json['success']) {
            $.each(json['listGroup'], function() {
                if (this.description != 'nil') {
                    createRoom(this.description)
                }
            });
        }
    });
}

function turnOnOff(id,onOff) {
    _this = $('.name-user[data-user = '+id+']');
    if (onOff){
        _this.removeClass('online').addClass('online')
        _this.text('online')
    }else{
        _this.removeClass('online')
        _this.text('offline')
    }
}


function addMessenger(id, userMessengerId, dataAppend) {
    _this = $("#message-content .group-chat");
    _this.append(dataAppend);
    userAuth = _this.find('.item-chat div[data-messenger=' + (id - 1) + ']').attr('data-user-auth');
    if ((id > 1) && (userAuth == userMessengerId)) {
        _this.find('.item-chat div[data-messenger=' + (id - 1) + ']').append(jQuery(dataAppend).find('.box-main-comment').html());
    } else {
        _this.find('.item-chat[data-messenger=' + id + ']').removeClass('wait-js')
    }
    $('#message-content').mCustomScrollbar('scrollTo', $('.box-comment[data-messenger="' + id + '"]'));
}