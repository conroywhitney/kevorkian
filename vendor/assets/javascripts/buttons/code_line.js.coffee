class MD.Button.CodeLine extends MD.Button

  constructor: (@attributes = {}) ->
    @name = "codeline"
    super(@name, @attributes)

  html: ->
    "CL"

  tooltip: ->
    "Code Line"

  buttonClick: (button, range) =>
    button.performAndSelect range, (text) ->
      "`#{text}`"