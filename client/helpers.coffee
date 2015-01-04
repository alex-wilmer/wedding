Template.registerHelper 'equals', (a, b) ->
  a == b

Template.registerHelper 'currentGuest', ->
  !!Session.get 'currentGuest'

Template.registerHelper 'home', ->
  if Session.get 'currentGuest' then 'home' else ''