Meteor.publish 'guests', -> Guests.find()
Meteor.publish 'guest', (id) -> Guests.find id
Meteor.publish 'guestbook', -> GuestbookPosts.find()