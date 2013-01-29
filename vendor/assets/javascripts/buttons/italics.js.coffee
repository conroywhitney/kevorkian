class MD.Button.Italics extends MD.Button

  constructor: (@attributes = {}) ->
    @name = "italics"
    super(@name, @attributes)

  tooltip: ->
    "Italics"

  html: ->
    "<em>I</em>"

  buttonClick: (button, range) =>
    button.performAndSelect range, (text) ->
      "_#{text}_"
