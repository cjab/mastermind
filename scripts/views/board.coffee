define [
  "jQuery",
  "Underscore",
  "Backbone",
  "cs!models/board",
  "cs!collections/guesses",
  "cs!views/guess",
  "cs!models/guess",
  "text!templates/board.html"
],

($, _, Backbone, Board, Guesses, GuessView, Guess, boardTemplate) ->

  class BoardView extends Backbone.View

    template: _.template(boardTemplate)

    initialize: ->
      @childViews = {}
      @model = new Board

      guesses = @model.get("guesses")
      guesses.bind "add",    @onAddGuess
      guesses.bind "remove", @onRemoveGuess

      guesses.add new Guess

      @render()


    onAddGuess: (guess) =>
      view = new GuessView model: guess
      @childViews[guess.cid] = view


    onRemoveGuess: (guess) =>
      @childViews[guess.cid].remove()
      delete @childViews[guess.cid]


    renderChildren: -> $(view.el for own id, view of @childViews)


    render: ->
      data = {}
      @$el.html @template(data)
      @$el.find('.guesses').html(@renderChildren())
