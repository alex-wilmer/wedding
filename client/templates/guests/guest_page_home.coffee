Template.guestPageHome.helpers
  pending: ->
    guest = Guests.findOne this._id
    guest.status == 'Pending'

  accepted: ->
    guest = Guests.findOne this._id
    guest.status == 'Accepted'

  declined: ->
    guest = Guests.findOne this._id
    guest.status == 'Declined'