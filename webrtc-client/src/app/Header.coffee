define('Header', ['Controller', 'view/header'], (Controller) ->
  class Header extends Controller
    className: 'chat-header'
    template: 'view/header'
    constructor: (name)->
      super
      @name = name
)