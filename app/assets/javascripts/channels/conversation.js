App.conversation = App.cable.subscriptions.create("ConversationChannel", {
  connected: function() {

  },
  disconnected: function() {
    console.log('disconnected');
  },
  received: function(data) {
    console.log('recieved');
    console.log(data);
    $(".messages-section").append(data.message);
    $(".alert.alert-info").show().delay(2000).fadeOut('slow');
    $("#message_body").val("");
    var messages = $("#chatbox");
    messages.scrollTop(messages[0].scrollHeight);
  },
  listen_to_messages: function(){
    console.log('listen_to_messages');
    var messageBox = $("#chatbox");
    messageBox.scrollTop(messageBox[0].scrollHeight);
    return this.perform('listen', {
      conversation_id: $("[data-conversation-id]").data("conversation-id")
    });
  }
});

$(document).on('turbolinks:load', function() {
  App.conversation.listen_to_messages();
});
