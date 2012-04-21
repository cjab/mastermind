define [
  "Underscore",
  "Backbone",
  "cs!models/code_peg"
],

(_, Backbone, CodePeg) ->

  class CodePegs extends Backbone.Collection

    model: CodePeg


    onSelect: (selected) => @selected = selected


    checkWin: (otherCollection) ->
      _.all @checkOrder(otherCollection), _.identity


    checkOrder: (otherCollection) ->
      @map (peg, index) ->
        otherCollection.at(index).get("type") == peg.get("type")


    numberInOrder: (otherCollection) ->
      _.filter(@checkOrder(otherCollection), _.identity).length


    checkType: (otherCollection) ->
      tmpCollection = new CodePegs otherCollection.models
      @map (peg, index) ->
        found = tmpCollection.find (otherPeg) ->
          peg.get("type") == otherPeg.get("type")
        if found
          tmpCollection.remove found
          true
        else
          false


    numberOfCorrectType: (otherCollection) ->
      _.filter(@checkType(otherCollection), _.identity).length


    initialize: -> @on "select", @onSelect
