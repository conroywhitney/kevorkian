class MD.Button.Bold extends MD.Button

  constructor: (@attributes = {}) ->
    @name = "bold"
    super(@name, @attributes)

  html: =>
    "<strong>B</strong>"

  tooltip: ->
    "Bold"

  buttonClick: (button, range) =>
    button.performAndSelect range, (text) ->
      "**#{text}**"
