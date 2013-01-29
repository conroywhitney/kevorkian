class MD.Button.Href extends MD.Button

  constructor: (@attributes = {}) ->
    @name = "href"
    super(@name, @attributes)

  tooltip: ->
    "Insert an href link tag."

  html: =>
    "A"

  modalWindow: =>
    $("""
      <div class="modal hide fade">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h3>Build Link</h3>
        </div>
        <div class="modal-body">
          <div class="control-group">
            <label class="control-label" for="href_text">Text</label>
            <div class="controls">
              <input type="text" id="href_text" placeholder="Text">
            </div>
          </div>
          <div class="control-group">
            <label class="control-label" for="href_link">Link</label>
            <div class="controls">
              <input type="text" id="href_link" placeholder="Link">
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <a href="#" class="btn" data-dismiss="modal">Close</a>
          <a href="#" class="btn btn-primary">Save</a>
        </div>
      </div>
     """)

  buttonClick: (button, range) =>
    el = $(button.editor.target_name)
    slice = new MD.Utils.Slice(el.val(), range)
    html = @modalWindow()
    $("#href_text", html).val(slice.textAtRange)
    html.modal()
    html.keyup (e) =>
      e?.preventDefault()
      if e.keyCode is 13
        $(".btn-primary", html).click()
    $(".btn-primary", html).click (e) =>
      e?.preventDefault()
      html.modal("hide")
      hrefText = $("#href_text", html).val()
      hrefLink = $("#href_link", html).val()
      results = button.perform range, (text) =>
        "[#{hrefText}](#{hrefLink})"
      button.setCaratRange(start: results.finalRange.end - 1)