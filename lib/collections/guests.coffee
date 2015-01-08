@Guests = new Mongo.Collection 'guests'

Guests.allow
  remove: ->
    Meteor.user()

  update: ->
    Meteor.user()

  update: ->
    !!Session.get 'currentGuest'

Meteor.methods
  guestInsert: (guest) ->
    check guest, 
      name: String
      ticket: String
      status: String

    if !guest.name
      throw new Meteor.Error 'invalid-guest', 'Please enter a name!'
      
    if (Guests.findOne name: guest.name)
      return guestExists: true  
    
    Guests.insert guest

  updateGuestRequest: (friend, id) ->
    check id, String
    check friend,
      name: String

    if !friend.name
      throw new Meteor.Error 'invalid-friend-request', 'Please enter a name!'

    Guests.update id,
      $set:
        friend: friend

  removeGuestRequest: (id) ->
    check id, String
    
    Guests.update id,
      $remove: friend
  
  attemptLogin: (ticket) ->
    check ticket, String

    guest = Guests.findOne ticket:ticket
     
    if !guest
      return wrongTicket: true 

    guestId: guest._id
