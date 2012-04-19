define [
  "Underscore",
  "Backbone",
  "cs!models/code_peg"
],

(_, Backbone, CodePeg) ->

  class CodePegs extends Backbone.Collection

    model: CodePeg

    initialize = ->
      alert "Initializing a CodePegs collection..."
