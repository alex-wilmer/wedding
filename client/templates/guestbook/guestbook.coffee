Template.guestbook.created = ->
  Session.set 'guestbookTemplate', 'guestbookPosts'

Template.guestbook.helpers
  guestbookTemplate: ->
    return Template[Session.get 'guestbookTemplate']

Template.guestbook.events
  'click a': (e) ->
    Session.set 'guestbookTemplate', e.target.id