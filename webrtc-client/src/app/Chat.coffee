define('Chat', ['jquery', 'Header', 'Messages', 'Footer', 'Controller'], ($, Header, Messages, Footer, Controller) ->
  class Chat extends Controller
    className: 'chat'
    constructor: (name, rtc, caller) ->
      super

      @name = name
      @rtc = rtc
      @caller = caller || @rtc.call(name)

      @rtc.on('chat', (msg) =>
        if @name is msg.from
          @receiveMessage({name: msg.from, message: msg.message})
      )

      header = new Header(name)
      @messages = new Messages()
      footer = new Footer(@rtc.user)

      @append header.render()
      @append @messages.render()
      @append footer.render()

      footer.bind('sendMessage', (message) =>
        @caller.chat(message.message)
        @receiveMessage(message)
      )

    receiveMessage: (message) ->
      @messages.addMessage(message)
)