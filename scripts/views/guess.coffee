define [
  "jQuery",
  "Underscore",
  "Backbone",
  "cs!models/guess",
  "cs!collections/code_pegs",
  "cs!views/code_peg_select",
  "text!templates/guess.html"
],

($, _, Backbone, Guess, CodePegs, CodePegSelectView, guessTemplate) ->

  class GuessView extends Backbone.View

    template: _.template(guessTemplate)
    events:
      "click .submit-guess": "onDone"


    initialize: ->
      @model = new Guess
      @childViews = [
        new CodePegSelectView
        new CodePegSelectView
        new CodePegSelectView
        new CodePegSelectView
      ]
      @render()


    renderChildren: -> $(view.el for own id, view of @childViews)


    onDone: =>
      codePegs = new CodePegs (view.codePegs.selected for view in @childViews)
      @model.set("codePegs", codePegs)
      @model.get("codePegs").each (peg) ->
        console.log peg.get("type")


    render: ->
      data = id : @model.cid
      @$el.html @template(data)
      @$el.find('.code-selection').html(@renderChildren())
