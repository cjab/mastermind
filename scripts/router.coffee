define [
  'jQuery',
  'Underscore',
  'Backbone'
],

($, _, Backbone) ->

  class AppRouter extends Backbone.Router
    routes: {}
    defaultAction: (actions) ->
      console.log "No Route:", actions


  initialize = ->
    #appRouter = new AppRouter
    #Backbone.history.start()

  return initialize: initialize
