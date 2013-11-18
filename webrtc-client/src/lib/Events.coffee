define('Events', ()->
  Events =
    bind: (ev, callback) ->
      calls = @hasOwnProperty('_callbacks') and @_callbacks or= {}
      calls[ev] or= []
      calls[ev].push callback
      this

    trigger: (args...) ->
      ev = args.shift()
      list = @hasOwnProperty('_callbacks') and @_callbacks?[ev]
      return unless list
      for callback in list
        if callback.apply(this, args) is false
          break
      true
)