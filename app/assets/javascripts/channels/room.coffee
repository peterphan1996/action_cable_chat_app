App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    if (data.message && !data.message.blank?)
      $('#messages-table').append data.message
      scroll_bottom()
    alert("You have a message from" + ) if data.mention

$(document).on 'turbolinks:load', ->
  submit_message()
  scroll_bottom()
  console.log $('#messages')[0].scrollHeight


submit_message = () ->
  $('#message_content').on 'keydown', (event) ->
    if event.keyCode is 13 && !event.shiftKey
      $('input').click()
      event.target.value = ""
      event.preventDefault()
  
scroll_bottom = () ->
  $('#messages').scrollTop($('#messages')[0].scrollHeight)
