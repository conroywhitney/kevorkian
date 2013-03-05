class MD.Utils.Carat

  @getRange: (target) ->
    pos = [0,0]
    ctrl = target[0]
    if ctrl.selectionStart or ctrl.selectionStart is '0'
      pos[0] = ctrl.selectionStart
    if ctrl.selectionEnd or ctrl.selectionEnd is '0'
      pos[1] = ctrl.selectionEnd
    return {start: pos[0], end: pos[1]}

  @setRange: (target, start, end = start) =>
    ctrl = target[0]
    ctrl.focus()
    ctrl.setSelectionRange(start, end)