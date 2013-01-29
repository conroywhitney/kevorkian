class @MD.Editor

  constructor: (@target_name) ->
    @clearRows()
    @addRow(MD.Row.defaultRow)
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
    el = $(@target_name)
    inner = el.clone()
    html = $("""
      <div id='#{@target_name.replace('#', '')}_md_editor' class='markdown_editor'>
        <div class='markdown_editor_toolbar' style="width: #{el.outerWidth(true)}px">
        </div>
      </div>
    """)
    for row in @rows
      $(".markdown_editor_toolbar", html).append(row.render())
    inner.appendTo(html)
    el.replaceWith(html)
    $(@target_name).keyup (e) =>
      @trigger("change", $(e.target).val())
    $(@target_name).change (e) =>
      @trigger("change", $(e.target).val())
    return @

