class MD.Button.H3 extends MD.Button

  constructor: (@attributes = {}) ->
    @name = "h3"
    super(@name, @attributes)

  tooltip: ->
    "H3"

  buttonClick: (button, range) =>
    results = button.perform range, (text) ->
      "### #{text}\n\n"
    button.setCaratRange(start: results.finalRange.end - 2)