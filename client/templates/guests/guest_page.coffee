Template.guestPage.created = ->
  Session.set 'guestPageTemplate', 'guestPageHome'

Template.guestPage.helpers
  guestPageTemplate: ->
    Template[Session.get 'guestPageTemplate']

Template.guestPage.events
  'click .set-status': (e) ->
    Guests.update this._id, $set: status: e.target.id

  'click .set-template': (e) ->
    Session.set 'guestPageTemplate', e.target.id

  'submit form.guest-request': (e) ->
    e.preventDefault()

    name = e.target.name.value

    if !name
      return alert 'Please enter a name!'

    friend = 
      name: name

    Meteor.call 'updateGuestRequest', friend, Session.get('currentGuest'), (error, result) ->
      Session.set 'guestPageTemplate', 'guestPageHome' 

  'click .danger': ->
    Meteor.call 'removeGuestRequest', Session.get('currentGuest'), (error, result) ->
      Session.set 'guestPageTemplate', 'guestPageHome'