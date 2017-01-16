jQuery(document).ready(function() {
    $(document).on("click", ".buy-chat-items", function(event) {
        var element = jQuery(this);
        var chatId = element.data("chat-id");
        var token = element.data("token");

        if (token == "" || token == undefined) {
            jQuery.ajax({
                url: '/chats/' + chatId + '/generate_checkout_token',
                data: {},
                success: function(data) {
                    var token = data.token;
                    element.data("token", token);
                    showSnapDialog(element);
                }
            });
        } else {
            showSnapDialog(element);
        }
    });
});

var showSnapDialog = function(element) {
    var token = element.data('token');
    console.log("Token", token);
    snap.pay(token, {
        onSuccess: function(res) {},
        onPending: function(res) {},
        onError: function(res) {}
    });
};
