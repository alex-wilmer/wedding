@Guests = new Mongo.Collection 'guests'

Guests.allow
  remove: ->
    Meteor.user()

  update: ->
    Meteor.user()

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
  
  attemptLogin: (ticket) ->
    check ticket, String

    guest = Guests.findOne ticket:ticket
     
    if !guest
      return wrongTicket: true 

    guestId: guest._id
