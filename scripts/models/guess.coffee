define [
  "Underscore",
  "Backbone"
],

(_, Backbone) ->

  class Guess extends Backbone.Model

    defaults: {}

    initialize = ->
      alert "Initializing a Guess..."


  return Guess
