class MD.Button.H1 extends MD.Button

  constructor: (@attributes = {}) ->
    @name = "h1"
    super(@name, @attributes)

  tooltip: ->
    "H1"

  buttonClick: (button, range) =>
    results = button.perform range, (text) ->
      "# #{text}\n\n"
    button.setCaratRange(start: results.finalRange.end - 2)