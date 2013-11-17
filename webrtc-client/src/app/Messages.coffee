define('Messages', ['Controller', 'view/messages'], (Controller) ->
  class Messages extends Controller
    className: 'chat-messages'
    template: 'view/messages'
    constructor: ->
      super
      @msg = []
    addMessage: (message) ->
      @msg.push(message)
      @render()
)