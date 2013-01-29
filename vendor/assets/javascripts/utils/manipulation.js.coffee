class MD.Utils.Manipulation

  @replaceRange: (target_name, range, func) ->
    el = $(target_name)
    val = el.val()
    slice = new MD.Utils.Slice(val, range)
    replacement = func(slice.textAtRange)
    final = "#{slice.first}#{replacement}#{slice.last}"
    el.val(final)
    return {
        slice: slice
        originalText: val
        finalText: final
        replacementText: replacement
        textAtRange: slice.textAtRange
        originalRange: range
        el: el
        finalRange:
          start: range.start
          end: range.start + replacement.length
      }