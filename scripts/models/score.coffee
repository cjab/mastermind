define [
  "Underscore",
  "Backbone"
],

(_, Backbone) ->

  class Score extends Backbone.Model

    defaults:
      correct: 0
      correctType: 0
