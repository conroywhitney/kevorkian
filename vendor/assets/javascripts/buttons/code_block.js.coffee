class MD.Button.CodeBlock extends MD.Button

  constructor: (@attributes = {}) ->
    @name = "codeblock"
    super(@name, @attributes)

  html: ->
    "CO"

  tooltip: ->
    "Code Block"

  buttonClick: (button, range) =>
    button.performAndSelect range, (text) ->
      lines = text.split("\n")
      nlines = []
      for line in lines
        nlines.push "    #{line}"
      nlines.join("\n")