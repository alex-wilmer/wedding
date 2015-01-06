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