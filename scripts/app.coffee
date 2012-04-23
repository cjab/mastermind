define [
  "jQuery"
  "Underscore"
  "Backbone"
  "cs!views/board"
  "cs!views/score_board"
],

($, _, Backbone, Board, ScoreBoard) ->

  initialize = ->
    board      = new Board el: $(".container-fluid")
    scoreBoard = new ScoreBoard el: $(".score-board"), model: board.model

  return initialize: initialize
