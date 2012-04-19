define [
  "jQuery",
  "Underscore",
  "Backbone",
  "cs!router",
  "cs!views/code_peg"
],

($, _, Backbone, Router, CodePegView) ->

  initialize = ->
    codePegView = new CodePegView
    codePegView.initialize()
    Router.initialize()

  return initialize: initialize
