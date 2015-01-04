@GuestbookPosts = new Mongo.Collection 'guestbookPosts'

Meteor.methods
  guestbookPostsInsert: (post) ->
    check post,
      body: String
      name: String
      guestId: String

    guest = Guests.findOne post.guestId
    if !guest
      return 'Guest does not exist.'

    GuestbookPosts.insert post 