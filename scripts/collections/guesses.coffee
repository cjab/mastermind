define [
  "Underscore",
  "Backbone",
  "cs!models/guess"
],

(_, Backbone, Guess) ->

  class Guesses extends Backbone.Collection

    model: Guess

    initialize = ->
      alert "Initializing a Guesses collection..."


  return Guesses
