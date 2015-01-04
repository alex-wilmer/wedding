assert = chai.assert

MochaWeb?.testOnly ->
  describe "comparing identical numbers", ->
    it "should return true", ->
      assert.equal(5,5)
