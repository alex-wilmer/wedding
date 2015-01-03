Template.registerHelper 'equals', (a, b) ->
  return a == b

Template.registerHelper 'currentGuest', ->
  return !!Session.get 'currentGuest'

Template.registerHelper 'home', ->
  return if Session.get 'currentGuest' then 'home' else ''