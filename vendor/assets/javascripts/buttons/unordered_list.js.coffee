class MD.Button.UnorderedList extends MD.Button

  constructor: (@attributes = {}) ->
    @name = "unorderedlist"
    super(@name, @attributes)

  html: ->
    "UL"

  tooltip: ->
    "Unordered List"

  buttonClick: (button, range) =>
    button.performAndSelect range, (text) ->
      lines = text.split("\n")
      nlines = []
      for line in lines
        nlines.push "* #{line}"
      nlines.join("\n")