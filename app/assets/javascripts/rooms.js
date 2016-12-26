// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function makeFormSubmitCallback(form) {
    var form = $(form);
    var messageTextArea = form.find('#chat-input-text');

    // jika user tekan tombol enter di input untuk text chat, maka kirim text
    // ke server dengan cara men-fire event submit pada form dimana text
    // tersebut berada. sehingga menjadi normal POST request.
    messageTextArea.on('keypress', function(e) {
        if (e.keyCode == 13) {
            e.preventDefault();
            form.submit();
        }
    });

    form.submit(function(e) {
        e.preventDefault();

        var messageText = messageTextArea.val();
        // tidak boleh mengirim text kosong
        if ($.trim(messageText).length > 1) {
            App.roomsTexting.sendMessage(messageText);
            messageTextArea.val('');
        } else {
            console.error('Blank message, cannot send it');
        }

        return false;
    });
}

$(document).ready(function() {
    makeFormSubmitCallback('#new_chat');
});
