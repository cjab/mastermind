define [
  "jQuery",
  "Underscore",
  "Backbone",
  "cs!models/board",
  "cs!collections/guesses",
  "cs!views/guess",
  "cs!models/guess",
  "cs!views/score_board",
  "text!templates/board.html"
],

($, _, Backbone, Board, Guesses, GuessView, Guess, ScoreBoard, boardTemplate) ->

  class BoardView extends Backbone.View

    template: _.template(boardTemplate)

    events:
      "click .play-again": "onPlayAgain"

    initialize: ->
      @model = new Board

      @childViews = {}
      @scoreBoardView = new ScoreBoard model: @model

      guesses = @model.get("guesses")
      guesses.bind "add",    @onAddGuess
      guesses.bind "remove", @onRemoveGuess
      guesses.bind "reset",  @onResetGuesses
      @model.bind "change:wins",   @onWin
      @model.bind "change:losses", @onLoss

      guesses.add new Guess

      @render()


    onWin: =>
      @$el.find(".play-again").show()


    onLoss: =>
      @$el.find(".play-again").show()


    onPlayAgain: =>
      @$el.find(".play-again").hide()
      @model.newCode()


    onAddGuess: (guess) =>
      view = new GuessView model: guess
      @childViews[guess.cid] = view
      @$el.find(".guesses").append(view.el)


    onRemoveGuess: (guess) =>
      view = @childViews[guess.cid]
      @$el.find(".guesses").remove(view.el)
      view.remove()
      delete @childViews[guess.cid]


    onResetGuesses: =>
      view.remove() for own key, view of @childViews
      @childViews = []


    renderChildren: ->
      view.delegateEvents() for own id, view of @childViews
      $(view.el for own id, view of @childViews)


    render: ->
      data = {}
      @scoreBoardView.render()
      @$el.html @template(data)
      @$el.find(".guesses").html @renderChildren()
