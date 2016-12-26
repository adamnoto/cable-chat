App.roomsTexting = App.cable.subscriptions.create("RoomsTextingChannel", {
    connected: function() {
        // Called when the subscription is ready for use on the server
    },

    disconnected: function() {
        // Called when the subscription has been terminated by the server
    },

    received: function(data) {
        $(".chats").append(data.chat);
        scrollToBottomOfChats();
    },

    sendMessage: function(message) {
        return this.perform('send_message', {
            message: message
        });
    }
});

function scrollToBottomOfChats() {
    var chatsBox = $(".chats");
    chatsBox.scrollTop(chatsBox.prop("scrollHeight"));
}

$(document).ready(function() {
    scrollToBottomOfChats();
});
