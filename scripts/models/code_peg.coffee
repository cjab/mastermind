define [
  "Underscore",
  "Backbone"
],

(_, Backbone) ->

  class CodePeg extends Backbone.Model

    defaults:
      color: "black"
      class: "btn-inverse"

    initialize = -> alert "Initializing a CodePeg..."

  return CodePeg
