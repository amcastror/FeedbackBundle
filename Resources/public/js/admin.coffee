$(document).ready ->
  buttons =
    remove: $(".feedback-delete")
    mark_as_read: $(".feedback-mark-as-read")
    mark_as_done: $(".feedback-mark-as-done")
    show_content: $(".feedback-show-content")

  buttons.remove.on 'click', (e) ->
    e.preventDefault();
    feedback.remove $(this).attr 'href'

  buttons.mark_as_done.on 'click', (e) ->
    e.preventDefault();
    feedback.mark_as.done $(this).attr 'href'

  buttons.mark_as_read.on 'click', (e) ->
    e.preventDefault();
    feedback.mark_as.read $(this).attr 'href'

  buttons.show_content.on 'click', ->
    feedback.show_content $(this).data 'content-id'

  return;

feedback =
  remove: (href)->
    sure = confirm("Are you sure?")
    if(!sure)
      return false
    $.ajax
      url: "#{href}"
      type: "DELETE"
      dataType: 'json'
      success: (rd)->
        if rd.status
          document.location.reload()
        else
          alert 'An error has occured'
    return false
  show_content: (id)->
    $("#entity_#{id}").slideToggle()
    return false
  mark_as:
    read: (href)->
      $.ajax
        url: "#{href}"
        type: "GET"
        dataType: "json"
        success: (rd)->
          if rd.status
            document.location.reload()
          else
            alert 'An error has occured'
      return false
    done: (href)->
      $.ajax
        url: "#{href}"
        type: "GET"
        dataType: "json"
        success: (rd)->
          if rd.status
            document.location.reload()
          else
            alert 'An error has occured'
      return false