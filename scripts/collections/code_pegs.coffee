define [
  "Underscore",
  "Backbone",
  "cs!models/code_peg"
],

(_, Backbone, CodePeg) ->

  class CodePegs extends Backbone.Collection

    model: CodePeg


    onSelect: (selected) => @selected = selected


    initialize: -> @on "select", @onSelect
