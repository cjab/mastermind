define [
  "jQuery",
  "Underscore",
  "Backbone",
  "text!templates/score_board.html"
],

($, _, Backbone, scoreBoardTemplate) ->

  class ScoreBoardView extends Backbone.View

    template: _.template(scoreBoardTemplate)

    initialize: ->
      @model.bind  "change:wins",   @onWin
      @model.bind  "change:losses", @onLoss
      @model.get("guesses").bind "add remove reset", @onGuess

      @render()


    onWin: => @render()


    onLoss: => @render()


    onGuess: => @render()


    render: ->
      data =
        wins:       @model.get "wins"
        losses:     @model.get "losses"
        guesses:    @model.get("guesses").length
        maxGuesses: @model.get "maxGuesses"
      @$el.html @template(data)
