class MD.Utils.Slice

  constructor: (@value, @range) ->
    @first = @value.slice(0, @range.start)
    @last = @value.slice(@range.end)
    @textAtRange = @value.substr(@range.start, @range.end - @range.start)