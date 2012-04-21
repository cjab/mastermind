define [
  "Underscore",
  "Backbone",
  "cs!collections/code_pegs"
],

(_, Backbone, CodePegs) ->

  class Guess extends Backbone.Model

    initialize: ->
      @set("codePegs", new CodePegs)
