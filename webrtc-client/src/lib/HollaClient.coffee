define('HollaClient', ['holla', 'Chat'], (holla, Chat) ->
  class HollaClient
    constructor: (user) ->
      @user = user
      @rtc = holla.createClient({ host: "localhost:8080"})
      @rtc.register(user)

      @rtc.on('call', @receiveCall)

    createChat: (caller) =>
      chat = new Chat(caller.user, @rtc, caller)
      entryPoint = $('#chat')
      entryPoint.append chat.render()

    receiveCall: (caller) =>
      @createChat(caller)

    getRTC: ->
      return @rtc
)