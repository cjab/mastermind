define [
  "jQuery",
  "Underscore",
  "Backbone",
  "cs!models/guess",
  "cs!views/code_peg_select",
  "text!templates/guess.html"
],

($, _, Backbone, Guess, CodePegSelectView, guessTemplate) ->

  class GuessView extends Backbone.View

    template: _.template(guessTemplate)


    initialize: ->
      @model = new Guess
      @childViews = [
        new CodePegSelectView
        new CodePegSelectView
      ]
      @render()


    renderChildren: -> $(view.el for own id, view of @childViews)


    render: ->
      data = id : @model.cid
      @$el.html @template(data)
      @$el.find('.code-selection').html(@renderChildren())
