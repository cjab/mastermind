define [
  "jQuery",
  "Underscore",
  "Backbone",
  "cs!models/code_peg",
  "text!templates/code_peg.html"
],

($, _, Backbone, CodePeg, codePegTemplate) ->

  class CodePegView extends Backbone.View

    template: _.template(codePegTemplate)


    initialize: ->
      @model = new CodePeg unless @model?
      @render()


    render: ->
      data = type: @model.get("type")
      @$el.html @template(data)
