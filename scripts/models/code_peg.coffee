define [
  "Underscore",
  "Backbone"
],

(_, Backbone) ->

  class CodePeg extends Backbone.Model

    defaults:
      type: "btn-inverse"
