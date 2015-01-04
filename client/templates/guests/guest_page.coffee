Template.guestPage.helpers
  pending: ->
    guest = Guests.findOne this._id
    guest.status == 'Pending'

  accepted: ->
    guest = Guests.findOne this._id
    guest.status == 'Accepted'

  declined: ->
    guest = Guests.findOne this._id
    guest.status == 'Declined'

Template.guestPage.events
  'click .set-status': (e) ->
    Guests.update this._id, $set: status: e.target.id