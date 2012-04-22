define [
  "Underscore",
  "Backbone",
  "cs!collections/code_pegs",
  "cs!models/score"
],

(_, Backbone, CodePegs, Score) ->

  class Guess extends Backbone.Model

    initialize: ->
      @set "codePegs", new CodePegs
      @set "score",    new Score
