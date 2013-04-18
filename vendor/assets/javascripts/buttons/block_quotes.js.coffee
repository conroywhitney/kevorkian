class MD.Button.BlockQuotes extends MD.Button

  constructor: (@attributes = {}) ->
    @name = "blockquotes"
    super(@name, @attributes)

  html: ->
    "BQ"

  tooltip: ->
    "Block Quotes"

  buttonClick: (button, range) =>
    button.performAndSelect range, (text) ->
      lines = text.split("\n")
      nlines = []
      for line in lines
        nlines.push "> #{line}"
      nlines.join("\n")