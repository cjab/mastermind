define [
  "jQuery",
  "Underscore",
  "Backbone",
  "cs!models/guess",
  "text!templates/guess.html"
],

($, _, Backbone, Guess, guessTemplate) ->

  class GuessView extends Backbone.View

    template: _.template(guessTemplate)

    initialize: ->
      @model = new Guess
      console.log "Initializing GuessView..."
      @render()

    render: ->
      data = id : @model.cid
      @$el.html @template(data)
