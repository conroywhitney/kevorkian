class MD.Utils.Carat

  @getRange: (target_name) ->
    pos = [0,0]
    ctrl = $(target_name)[0]
    if ctrl.selectionStart or ctrl.selectionStart is '0'
      pos[0] = ctrl.selectionStart
    if ctrl.selectionEnd or ctrl.selectionEnd is '0'
      pos[1] = ctrl.selectionEnd
    return {start: pos[0], end: pos[1]}

  @setRange: (target_name, start, end = start) =>
    ctrl = $(target_name)[0]
    ctrl.focus()
    ctrl.setSelectionRange(start, end)