class MD.Button

  constructor: (name, attributes = {}) ->
    @name = name
    @attributes = attributes
    @attributes["onClick"] ?= @buttonClick
    @attributes["html"] ?= @html

  buttonClick: (button, range) =>

  html: =>
    @name.toUpperCase()

  onClick: (e) =>
    e?.preventDefault()
    if @attributes.onClick
      @attributes.onClick(@, MD.Utils.Carat.getRange(@editor.target_name))

  render: =>
    button = $("<button class='btn'></button>").append(@attributes.html())
    button.click(@onClick)
    if @tooltip?
      button.attr("title", @tooltip())
      button.tooltip()
    return button

  perform: (range, callback) =>
    @editor.trigger("before.perform", range, @)
    results = MD.Utils.Manipulation.replaceRange(@editor.target_name, range, callback)
    @editor.trigger("after.perform", range, @, results)
    @editor.trigger("change", results.finalText)
    return results

  performAndSelect: (range, callback) =>
    results = @perform(range, callback)
    @setCaratRange(results.finalRange)
    return results

  setCaratRange: (range) =>
    @editor.trigger("before.setCarat", range, @)
    MD.Utils.Carat.setRange(@editor.target_name, range.start, range.end)
    @editor.trigger("after.setCarat", range, @)