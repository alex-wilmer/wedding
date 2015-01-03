MochaWeb?.testOnly ->
  describe "comparing identical numbers", ->
    it "should return true", ->
      chai.assert.equal(5,5)
