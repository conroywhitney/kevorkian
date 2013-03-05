class @MD.Editor

  constructor: (@target) ->
    @clearRows()
    @addRow(new MD.Row([
      new MD.Button.H1(),
      new MD.Button.H2(),
      new MD.Button.H3(),
      new MD.Button.Seperator(),
      new MD.Button.Bold(),
      new MD.Button.Italics(),
      new MD.Button.Seperator(),
      new MD.Button.BlockQuotes(),
      new MD.Button.OrderedList(),
      new MD.Button.UnorderedList(),
      new MD.Button.CodeBlock(),
      new MD.Button.CodeLine(),
      new MD.Button.Seperator(),
      new MD.Button.Href(),
      new MD.Button.Hr()
    ]))
    @events = {}

  on: (event, callback) ->
    @events[event] ?= []
    @events[event].push callback

  trigger: (event, etc...) ->
    for callback in (@events[event] || [])
      callback(@, etc...)

  clearRows: =>
    @rows = []

  addRow: (row) =>
    row.setEditor(@)
    @rows.push(row)

  render: =>
    el = @target
    # inner = el.clone()

    html = $("""
      <div class='markdown_editor'>
        <div class='markdown_editor_toolbar'">
        </div>
      </div>
    """)

    toolbar = $(".markdown_editor_toolbar", html)
    outer = el.outerWidth(true)
    if outer is 100
      toolbar.addClass("span10")
    else
      toolbar.css("width", "#{outer}px")

    for row in @rows
      toolbar.append(row.render())

    html.insertBefore(el)
    el.keyup (e) =>
      @trigger("change", $(e.target).val())
    el.change (e) =>
      @trigger("change", $(e.target).val())
    return @