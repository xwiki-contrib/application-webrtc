define("Controller", ['jquery'], ($) =>
  class Controller
    constructor: ->
      @el = $('<div/>') unless @el
      @el.addClass @className if @className
      @el.attr 'id' , @id if @id

    render: ->
      if @template
        template = require(@template)
        @el.html template.call(@, @)
      return @el

    append: (dom) ->
      @el.append(dom)
      @el

    @include: (obj) ->
      throw new Error('include(obj) requires obj') unless obj
      for key, value of obj
        @::[key] = value
      this

    @extend: (obj) ->
      throw new Error('extend(obj) requires obj') unless obj
      for key, value of obj
        @[key] = value
      this
)