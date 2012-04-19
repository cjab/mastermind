define [
  "jQuery",
  "Underscore",
  "Backbone",
  "cs!router",
  "cs!views/board"
],

($, _, Backbone, Router, Board) ->

  initialize = ->
    Router.initialize()
    board = new Board el: $('.container')

  return initialize: initialize
