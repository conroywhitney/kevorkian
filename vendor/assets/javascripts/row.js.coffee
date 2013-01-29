class MD.Row

  constructor: (@buttons) ->

  setEditor: (@editor) =>
    for button in @buttons
      button.row = @
      button.editor = @editor

  render: =>
    html = $("<div class='markdown_editor_row navbar-inner'></div>")
    for button in @buttons
      html.append(button.render())
    return html