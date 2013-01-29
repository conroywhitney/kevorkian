class MD.Button.H2 extends MD.Button

  constructor: (@attributes = {}) ->
    @name = "h2"
    super(@name, @attributes)

  tooltip: ->
    "H2"

  buttonClick: (button, range) =>
    results = button.perform range, (text) ->
      "## #{text}\n\n"
    button.setCaratRange(start: results.finalRange.end - 2)