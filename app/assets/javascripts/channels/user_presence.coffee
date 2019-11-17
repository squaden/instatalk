jQuery(document).on 'turbolinks:load', ->
  App.user_presence = App.cable.subscriptions.create "UserPresenceChannel",
    connected: ->
      console.log('Connected to UserPresenceChannel')

    disconnected: ->
      console.log('Disconnected from UserPresenceChannel')

    received: (data) ->
      console.log('Received message: ' + data['users_online'])

      $('#users-online').empty()
      $('#users-online').append data['users_online']

    speak: ->
      @perform 'speak'
