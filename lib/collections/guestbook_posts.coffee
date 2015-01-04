@GuestbookPosts = new Mongo.Collection 'guestbookPosts'

Meteor.methods
  guestbookPostsInsert: (post) ->
    check post,
      body: String
      guestId: String

    guest = Guests.findOne post.guestId

    if !guest
      return 'Guest does not exist.'

    post = _.extend post, name: guest.name

    GuestbookPosts.insert post