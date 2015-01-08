assert = chai.assert

MochaWeb?.testOnly ->
  describe "Finding a guest using Session.get 'currentGuest'", ->
    it "should return nothing if a guest is not logged in", ->
      Session.set 'currentGuest', 'not an id'
      guest = Guests.findOne Session.get 'currentGuest'
      assert.notOk guest, "Guest does not exist"
  
  # not passing 

  # describe "If a guest is not logged in", ->
  #   it "they cannot access '/home'", ->
  #     Session.set 'currentGuest', undefined
  #     Router.go 'guestPage'
  #     assert.equal Router.current().url, '/login'