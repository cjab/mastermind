define [
  "Underscore",
  "Backbone",
  "cs!collections/guesses"
],

(_, Backbone, Guesses) ->

  class Board extends Backbone.Model

    defaults: {}

    initialize = ->
      @guesses = new Guesses
      alert "Initializing a Board..."
      console.log @guesses


  return Board
