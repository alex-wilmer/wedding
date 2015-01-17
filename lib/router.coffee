Router.configure
  layoutTemplate: 'layout'

# Guest Routes

Router.route '/', name: 'splash'
Router.route '/details', name: 'details'
Router.route '/login', name: 'guestLogin'
Router.route '/home', 
  name: 'guestPage'
  waitOn: ->
    Meteor.subscribe 'guest', Session.get 'currentGuest'
  data: ->
    Guests.findOne()

Router.route '/guestbook',
  name: 'guestbook'
  waitOn: ->
    [ Meteor.subscribe('guestbook')
      Meteor.subscribe('guest', Session.get('currentGuest')) ]
  data: ->
    guestbookPosts: GuestbookPosts.find()

# Admin Routes

Router.route '/guests', 
  name: 'guests'
  waitOn: ->
    Meteor.subscribe 'guests'

Router.route '/guests/:_id', 
  name: 'guestDetails'
  waitOn: ->
    Meteor.subscribe 'guest', this.params._id
  data: ->
    Guests.findOne()

Router.route '/guests/:_id/edit',
  name: 'guestDetailsEdit'
  waitOn: ->
    Meteor.subscribe 'guest', this.params._id
  data: ->
    Guests.findOne()

# Hooks

requireGuestLogin = ->
  guest = Guests.findOne()
  if !guest
    Router.go 'guestLogin'
  else this.next()

requireAdminLogin = ->
  if !Meteor.userId() 
    Router.go 'guests'
  else this.next()

Router.onBeforeAction requireGuestLogin, only: 'guestPage'
Router.onBeforeAction requireAdminLogin, only: ['guestDetails', 'guestDetailsEdit']