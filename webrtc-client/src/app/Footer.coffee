define('Footer', ['Controller', 'Events', 'view/footer'], (Controller, Events)->
  class Footer extends Controller
    @include Events
    template: 'view/footer'
    className: 'chat-footer'
    constructor: (name) ->
      super()
      @name = name

    render: () ->
      super
      inputText = @el.find('.message')
      @el.find('button').on('click', () =>
        message = inputText.val()
        @trigger('sendMessage', {
          message: message,
          name: @name
        })
        inputText.val('')
      )
      inputText.on('keypress', (ev) =>
        if ev.keyCode is 13
          @trigger('sendMessage', {
            message: inputText.val(),
            name: @name
          })
          inputText.val('')
      )
      @el
)