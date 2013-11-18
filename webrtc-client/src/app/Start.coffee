requirejs.config
  baseUrl: "js"
  paths:
    holla: 'holla.min'

require(['jquery', 'Chat', 'HollaClient'], ($, Chat, HollaClient) ->
  window.HollaClient= HollaClient;
  window.Chat = Chat;
#   rtc = new HollaClient("Alex")
#   document.querySelector("#user").addEventListener("click", () =>
#     chat = new Chat('Vic', rtc.getRTC())
#     $('#chat').append(chat.render())
#   )
)
