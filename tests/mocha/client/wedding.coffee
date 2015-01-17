assert = chai.assert
expect = chai.expect

MochaWeb?.testOnly ->
  describe "Finding a guest using Session.get 'currentGuest'", ->
    it "should return nothing if a guest is not logged in", ->
      Session.set 'currentGuest', 'not an id'
      guest = Guests.findOne Session.get 'currentGuest'
      assert.notOk guest, "Guest does not exist"
  
  # not passing 

  describe "A user cannot access '/home' if", ->

    test = (done) ->      
      Router.go 'guestPage'      
      delay 400, -> 
        assert.equal Router.current().url, '/login'
        done()

    it "currentGuest is undefined", (done) ->
      Session.set 'currentGuest', undefined
      test(done)

    it "currentGuest is an invalid id", (done) ->
      Session.set 'currentGuest', 'not a valid id'
      test(done)