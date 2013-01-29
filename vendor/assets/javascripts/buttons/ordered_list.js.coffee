class MD.Button.OrderedList extends MD.Button

  constructor: (@attributes = {}) ->
    @name = "orderedlist"
    super(@name, @attributes)

  html: ->
    "OL"

  tooltip: ->
    "Ordered List"

  buttonClick: (button, range) =>
    button.performAndSelect range, (text) ->
      lines = text.split("\n")
      nlines = []
      for line, i in lines
        nlines.push "#{i + 1}. #{line}"
      nlines.join("\n")