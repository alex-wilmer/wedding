Template.guestbook.created = ->
  Session.set 'guestbookTemplate', 'guestbookPosts'

Template.guestbook.helpers
  guestbookTemplate: ->
    Template[Session.get 'guestbookTemplate']

Template.guestbook.events
  'click .a': (e) ->
    Session.set 'guestbookTemplate', e.target.id

  'click .submit': ->
    body = $('[name="body"]').val()

    if !body
      return alert 'You forgot to write anything!'

    post =
      body: body
      guestId: Session.get 'currentGuest'

    Meteor.call 'guestbookPostsInsert', post, (error, result) ->
      if (error)
        alert error.reason

      Session.set 'guestbookTemplate', 'guestbookPosts'
