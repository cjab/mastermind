define [
  "jQuery",
  "Underscore",
  "Backbone",
  "cs!views/board"
],

($, _, Backbone, Board) ->

  initialize = ->
    board = new Board el: $('.container')

  return initialize: initialize
