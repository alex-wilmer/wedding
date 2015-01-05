Template.details.created = ->
  Session.set 'detailsTemplate', 'detailsGeneral'

Template.details.helpers
  detailsTemplate: ->
    Template[Session.get 'detailsTemplate']

Template.details.events
  'click nav a': (e) ->
    Session.set 'detailsTemplate', e.target.id