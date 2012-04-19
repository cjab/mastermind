define [
  "jQuery",
  "Underscore",
  "Backbone",
  "cs!collections/guesses",
  "cs!views/guess",
  "cs!models/guess",
  "text!templates/board.html"
],

($, _, Backbone, Guesses, GuessView, Guess, boardTemplate) ->

  class BoardView extends Backbone.View

    childViews: {}
    template: _.template(boardTemplate)
    events: "click": "click"

    initialize: ->
      @guesses = new Guesses
      @guesses.bind "add", @addGuess
      @guesses.bind "remove", @removeGuess

      @guesses.add [
        new Guess
        new Guess
        new Guess
      ]

      @render()


    click: -> console.log "Implement Me!"


    addGuess: (guess) =>
      view = new GuessView model: guess
      @childViews[guess.cid] = view


    removeGuess: (guess) =>
      @childViews[guess.cid].remove()
      delete @childViews[guess.cid]


    renderChildren: -> $(view.el for own id, view of @childViews)


    render: ->
      data = {}
      @$el.html @template(data)
      @$el.find('.guesses').html(@renderChildren())
