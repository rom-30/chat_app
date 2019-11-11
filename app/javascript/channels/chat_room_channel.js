import consumer from "./consumer"

consumer.subscriptions.create("ChatRoomChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    $('#message-container').append(data.content)

    const scrollToBottom = () => {
      if ($('#messages').length > 0) {
        $('#messages').scrollTop($('#messages')[0].scrollHeight);
      }
    }
    scrollToBottom()

    // No need for EventListener since we will only execute that code
    // if a message is sent
    const te = document.querySelector('#message_body');
    te.value = "";
  }
});
