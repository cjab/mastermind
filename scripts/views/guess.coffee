define [
  "jQuery",
  "Underscore",
  "Backbone",
  "cs!models/guess",
  "cs!collections/code_pegs",
  "cs!views/code_peg_select",
  "cs!views/score",
  "text!templates/guess.html"
],

($, _, Backbone, Guess, CodePegs, CodePegSelectView, ScoreView, guessTemplate) ->

  class GuessView extends Backbone.View

    template: _.template(guessTemplate)
    events:
      "click .submit-guess": "onDone"


    initialize: ->
      @model = new Guess unless @model?

      @model.get("score").on "change", @onScoreChange

      @scoreView  = new ScoreView model: @model.get("score")
      @childViews = [
        new CodePegSelectView
        new CodePegSelectView
        new CodePegSelectView
        new CodePegSelectView
      ]
      @render()


    renderChildren: -> $(view.el for own id, view of @childViews)


    onScoreChange: (guess) =>
      @$el.find(".score").html(@scoreView.render()).show()


    onDone: =>
      codePegs = (view.codePegs.selected for view in @childViews)
      if _.all codePegs, _.identity
        @model.set("codePegs", new CodePegs codePegs)
        view.disable() for view in @childViews
        @$el.find(".submit-guess").remove()
      else
        alert "You cannot submit an incomplete code"


    render: ->
      data = id : @model.cid
      @$el.html @template(data)
      @$el.find(".code-selection").html @renderChildren()
